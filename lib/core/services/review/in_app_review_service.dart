import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:in_app_review/in_app_review.dart';

import '../../core_export.dart';

class InAppRatingService {
  late final InAppReview _inAppReview;
  final _usecase = serviceLocator<AppPreferences>();
  InAppRatingService() {
    // * Initialize the in-app review plugin
    _inAppReview = InAppReview.instance;
    if (Platform.isIOS) {
      _inAppReview.openStoreListing(appStoreId: 'your_app_store_id');
    }
  }

  /// Requests a review if certain conditions are met
  Future<void> requestReviewIfNeeded(void Function(int) onRatingRequested) async {
    // * Don't show rating prompt on web (not supported)
    if (kIsWeb) {
      return;
    }
    // * If we can show a review dialog
    if (await _inAppReview.isAvailable()) {
      // * Use an exponential backoff function:
      // * - 1st request after 3 course tips
      // * - 2nd request after another 10 course tips
      // * - 3rd request after another 20 course tips

      final inAppReviewRequestCount = await _usecase.getAppReviewCount();
      final completedTasksCount = await _usecase.getCourseDetailsCount();

      if (completedTasksCount >= 2 && inAppReviewRequestCount == 0 ||
          completedTasksCount >= 8 && inAppReviewRequestCount == 1 ||
          completedTasksCount >= 23 && inAppReviewRequestCount == 2) {
        // * Request the review
        await _inAppReview.requestReview();
        // * Increment the count
        await _usecase.setAppReview(inAppReviewRequestCount + 1);
        onRatingRequested(completedTasksCount);
      } else {
        // * Count course Details Tapped
        await _usecase.setCourseDetailsCount(completedTasksCount + 1);
      }
    }
  }
}
