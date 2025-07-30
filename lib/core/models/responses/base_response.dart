import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

class BaseResponse<T> extends Equatable {
  final T result; // Generic result (can be a list, map, or any type)
  final int totalPages; // Total number of pages
  final int totalItems; // Total number of items

  const BaseResponse({
    required this.result,
    required this.totalPages,
    required this.totalItems,
  });

  // Factory method to create the response from Dio Response
  factory BaseResponse.fromResponse({
    required Response response,
    required T Function(dynamic) fromMap, // Parse result dynamically
  }) {
    // Extract metadata from headers
    final totalItems = int.tryParse(response.headers.value('X-WP-Total') ?? '0') ?? 0;
    final totalPages = int.tryParse(response.headers.value('X-WP-TotalPages') ?? '0') ?? 0;

    // Parse the result (use dynamic to support multiple data types)
    final result = fromMap(response.data);

    return BaseResponse<T>(
      result: result,
      totalPages: totalPages,
      totalItems: totalItems,
    );
  }

  @override
  List<Object?> get props => [result, totalPages, totalItems];
}
