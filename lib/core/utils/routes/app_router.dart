// ignore_for_file: unused_local_variable

import 'package:go_router/go_router.dart';
import '../../../features/features_export.dart';
import '../../core_export.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RouteNames.splash,
  routes: [
    GoRoute(
      path: RouteNames.splash,
      builder: (context, state) => const SplashPage(),
    ),
    
  ],
  redirect: (context, state) {
    final prefs = serviceLocator<AppPreferences>();
    final isLoggedIn = prefs.getUserToken().then((value) => value.isNotEmpty);

    // لاحقًا عدل هذا حسب حالتك الفعلية
    if (state.matchedLocation == RouteNames.login) return null;
    return null;
  },
);
