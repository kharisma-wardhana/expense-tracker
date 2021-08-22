import 'package:flutter/material.dart';
import 'package:tracker/common/style.dart';

class BasePage extends StatelessWidget {
  final Widget body;
  final bool isLoading;

  const BasePage({
    Key? key,
    required this.body,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          isLoading
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : SizedBox(),
          body,
        ],
      ),
    );
  }
}
