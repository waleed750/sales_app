import '/core/core_export.dart';

class EmailValidator implements CustomValidator<String> {
  @override
  String? validate(value, {String? message}) {
    if (value.isNullOrEmpty) return AppStrings.tr.thisFieldIsEmpty;
    if (_validEmail(value!)) return null;
    return message ?? AppStrings.tr.textFieldEmailValidator;
  }

  bool _validEmail(String value) {
    String pattern =
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
