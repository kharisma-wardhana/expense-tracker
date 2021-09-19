import 'package:flutter/material.dart';
import 'package:tracker/common/style.dart';

class BasePage extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;
  final bool isLoading;

  const BasePage({
    Key? key,
    required this.body,
    this.appBar,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      appBar: appBar,
      body: Stack(
        children: [
          isLoading
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : SizedBox(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: body,
          ),
        ],
      ),
    );
  }
}
