import 'package:flutter/material.dart';
import 'package:tracker/common/style.dart';

class PopUpDialog {
  static PopUpDialog? _instance;

  PopUpDialog._internal() {
    _instance = this;
  }

  factory PopUpDialog() => _instance ?? PopUpDialog._internal();

  static void showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      _instance!._snackBarContent(
        bgColor: Colors.red,
        icons: Icons.error,
        message: message,
      ),
    );
  }

  static void showInfoSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      _instance!._snackBarContent(
        bgColor: Colors.white,
        textColor: darkSecondaryColor,
        iconColor: darkSecondaryColor,
        icons: Icons.info,
        message: message,
      ),
    );
  }

  SnackBar _snackBarContent({
    required String message,
    IconData icons = Icons.info_rounded,
    Color bgColor = Colors.grey,
    Color textColor = Colors.white,
    Color iconColor = Colors.white,
  }) {
    return SnackBar(
      backgroundColor: bgColor,
      content: Row(
        children: [
          Icon(
            icons,
            color: iconColor,
          ),
          SizedBox(
            width: defaultSpacing,
          ),
          Text(
            message,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
