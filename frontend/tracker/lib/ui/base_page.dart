import 'package:flutter/material.dart';
import 'package:tracker/shared/widgets/widgets.dart';

class BasePage extends StatelessWidget {
  const BasePage({
    Key? key,
    this.isLoading = false,
    required this.body,
  }) : super(key: key);

  final Widget body;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading ? CustomLoading() : body,
      ),
    );
  }
}
