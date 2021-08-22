import 'package:flutter/material.dart';
import 'package:tracker/common/style.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String? iconAsset;
  final TextFormField formField;

  const CustomTextField({
    Key? key,
    required this.title,
    this.iconAsset,
    required this.formField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(
                children: [
                  iconAsset != null
                      ? Image.asset(
                          iconAsset!,
                          width: 17,
                        )
                      : SizedBox(),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(child: formField),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
