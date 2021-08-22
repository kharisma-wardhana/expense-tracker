import 'package:flutter/material.dart';
import 'package:tracker/common/style.dart';
import 'package:tracker/presentation/pages/auth/base_auth_page.dart';
import 'package:tracker/presentation/widgets/custom_text_field.dart';
import 'package:tracker/utils/navigation.dart';
import 'package:tracker/utils/validator.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool _isForgotPassLoading = false;
  bool _isResetSuccess = false;
  TextEditingController _emailController = new TextEditingController();

  Widget _buildResetButton() {
    return Container(
      height: defaultPadding * 3,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
          ),
        ),
        onPressed: () {},
        child: Text(
          "Reset Password",
          style: Theme.of(context).textTheme.button?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }

  Widget _buildPopUpDialog() {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: defaultMargin,
            height: defaultMargin,
            child: Image.asset("assets/icon/icon_email.png"),
          ),
          SizedBox(height: defaultMargin),
          Row(
            children: [
              Text("Please check your email to reset password"),
            ],
          ),
          SizedBox(height: defaultSpacing),
          Container(
            width: double.infinity,
            height: defaultPadding * 3,
            child: ElevatedButton(
              onPressed: () {
                _emailController.text = "";
                Navigation.back();
              },
              child: Text("OK"),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseAuthPage(
        title: "Forgot Password",
        isLoading: _isForgotPassLoading,
        contentBody: Expanded(
          child: Stack(
            children: [
              Form(
                child: Column(
                  children: [
                    CustomTextField(
                      title: 'Email address',
                      iconAsset: 'assets/icon/icon_email.png',
                      formField: TextFormField(
                        validator: validateEmail,
                        controller: _emailController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Email',
                          hintStyle: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ),
                    SizedBox(height: defaultSpacing),
                    _buildResetButton(),
                  ],
                ),
              ),
              _isResetSuccess ? _buildPopUpDialog() : SizedBox(),
            ],
          ),
        ));
  }
}
