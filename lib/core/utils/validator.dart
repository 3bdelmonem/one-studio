import 'package:one_studio_task/core/navigation/app_navigator.dart';
import 'package:one_studio_task/core/injection/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:one_studio_task/core/extensions/localization.dart';

class Validator {
  static BuildContext context = sl<AppNavigator>().context;

  static String? defaultValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }
    return null;
  }

  static String? dateOfBirth(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }
    return null;
  }

  static String? checkBox(bool? value) {
    if (value == null || !value) {
      return context.tr.errorFieldRequired;
    }
    return null;
  }

  static String? text(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }
    if (!RegExp('[a-zA-Z]').hasMatch(value)) {
      return context.tr.errorInvalidName;
    }
    return null;
  }

  static String? hasValidUrl(String? value) {
    const pattern =
        r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?';
    if (value == null || value.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }
    if (!RegExp(pattern).hasMatch(value)) {
      return context.tr.errorInvalidUrl;
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
      return context.tr.errorInvalidEmail;
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }
    if (value.length < 8 ||
        !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9#?!@$%^&*-]).{8,}$')
            .hasMatch(value)) {
      return context.tr.errorInvalidPassword;
    }
    return null;
  }

  static String? confirmPassword(String? confirmPassword, String? password) {
    if (confirmPassword == null || confirmPassword.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }
    if (confirmPassword != password) {
      return context.tr.errorPasswordMismatch;
    }
    return null;
  }

  static String? numbers(String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.tr.errorFieldRequired;
    }
    final sanitizedValue = value.startsWith("+") ? value.replaceFirst("+", "") : value;
    if (int.tryParse(sanitizedValue) == null) {
      return context.tr.errorInvalidNumber;
    }
    return null;
  }

}