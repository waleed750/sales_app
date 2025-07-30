// ignore_for_file: library_private_types_in_public_api

import '../../core_export.dart';

class ValidateMessages {
  static _ErrorMessage erorr = _ErrorMessage();
  static _SuccessMessage success = _SuccessMessage();
}

class _ErrorMessage {
  final userLogin = AppStrings.tr.employeeCodeOrPasswordIsWrong;
  final emptyField = AppStrings.tr.thisFieldIsEmpty;
  final theCodeLengthShouldBeBetween =
      AppStrings.tr.theCodeLengthShouldBeBetween;
  final invalidDateFormatPleaseUse = AppStrings.tr.invalidDateFormatPleaseUse;
  final enterTheDateInTheFormat = AppStrings.tr.enterTheDateInTheFormat;
  final invalidDateValues = AppStrings.tr.invalidDateValues;
  final genericError = AppStrings.tr.genericError;
  final badRequest = AppStrings.tr.badRequest;
  final unauthorizedError = AppStrings.tr.unauthorizedError;
  final notFound = AppStrings.tr.notFound;
  final methodNotAllowed = AppStrings.tr.methodNotAllowed;
  final requestTimeout = AppStrings.tr.requestTimeout;
  final requestWasCancelled = AppStrings.tr.requestWasCancelled;
  final noInternetConnection = AppStrings.tr.noInternetConnection;
}

class _SuccessMessage {
  // final userLogin = AppStrings.tr.loginSuccess;
}
