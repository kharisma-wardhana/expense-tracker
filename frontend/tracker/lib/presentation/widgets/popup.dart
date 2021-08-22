import 'package:flutter/material.dart';
import 'package:tracker/common/style.dart';

class PopUpDialog {
  static void showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Row(
          children: [
            Icon(
              Icons.error,
              color: Colors.white,
            ),
            SizedBox(
              width: defaultSpacing,
            ),
            Text(
              message,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )));
  }

  static void showInfoSnackbar() {}

  Widget showAlertDialog() {
    return AlertDialog();
  }
}
