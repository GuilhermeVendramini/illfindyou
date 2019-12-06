import 'package:illfindyou/src/shared/i18n/en-US.dart';

class DefaultValidators {
  DefaultValidators._();

  static String isNotEmpty(String value) {
    if (value.isEmpty) {
      return Strings.valIsNotEmpty;
    }

    return null;
  }

  static String isEmail(String value) {
    String valueValidate = isNotEmpty(value);

    if (valueValidate != null) {
      return valueValidate;
    }

    if (value.contains("@") == false) {
      return Strings.valEmail;
    }

    return null;
  }

  static String password(String value) {
    String valueValidate = isNotEmpty(value);

    if (valueValidate != null) {
      return valueValidate;
    }

    if (value.length < 8) {
      return Strings.valMinLength;
    }

    return null;
  }

  static String confirmPassword(String value, String firstValue) {
    String passwordValidate = password(value);

    if (passwordValidate != null) {
      return passwordValidate;
    }

    if (value != firstValue) {
      return Strings.valPasswordNotConfirm;
    }

    return null;
  }
}
