import 'package:flutter/material.dart';
import 'package:tracker/common/style.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextFormField formField;
  final String? iconAsset;
  final Widget? traillingIcon;

  const CustomTextField({
    Key? key,
    required this.title,
    required this.formField,
    this.iconAsset,
    this.traillingIcon,
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
            padding: const EdgeInsets.symmetric(
              horizontal: defaultSpacing * 2,
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
                  const SizedBox(
                    width: defaultSpacing,
                  ),
                  Expanded(child: formField),
                  traillingIcon != null
                      ? traillingIcon!
                      : const SizedBox(height: defaultSpacing * 6),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
