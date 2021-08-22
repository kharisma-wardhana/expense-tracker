import 'package:flutter/material.dart';
import 'package:tracker/common/style.dart';

class BaseAuthPage extends StatelessWidget {
  final Widget contentBody;
  final String title;
  final String subtitle;
  final bool isLoading;

  const BaseAuthPage({
    Key? key,
    required this.contentBody,
    this.title = "",
    this.subtitle = "",
    this.isLoading = false,
  }) : super(key: key);

  Widget _buildLoadingIndicator() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.2),
      ),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  title == ""
                      ? SizedBox()
                      : Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  Text(
                                    subtitle,
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                  SizedBox(height: defaultMargin),
                  contentBody,
                ],
              ),
            ),
            isLoading ? _buildLoadingIndicator() : SizedBox(),
          ],
        ),
      ),
    );
  }
}
