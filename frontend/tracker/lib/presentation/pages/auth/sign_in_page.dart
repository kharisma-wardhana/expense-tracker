import 'package:flutter/material.dart';
import 'package:tracker/common/style.dart';
import 'package:tracker/domain/router/router.dart';
import 'package:tracker/presentation/cubit/auth/auth_cubit.dart';
import 'package:tracker/presentation/pages/auth/base_auth_page.dart';
import 'package:tracker/presentation/widgets/custom_text_field.dart';
import 'package:tracker/presentation/widgets/popup.dart';
import 'package:tracker/utils/navigation.dart';
import 'package:tracker/utils/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';
  bool _isSignInLoading = false;
  bool _isShowPassword = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _isSignInLoading = false;
    _isShowPassword = false;
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _buildBottomContent() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don\'t have an account? ',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          TextButton(
            onPressed: () {
              Navigation.intent(SignUpRoute);
            },
            child: Text(
              'Sign up',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: darkSecondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonSignIn(String title, VoidCallback? onPressed) {
    return Container(
      height: defaultPadding * 3,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: Theme.of(context).textTheme.button?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }

  void _signIn({bool isGoogleSignIn = false}) async {
    setState(() => _isSignInLoading = true);
    if (isGoogleSignIn) {
      await context.read<AuthCubit>().googleSignIn();
    } else {
      await context.read<AuthCubit>().signIn(
            _emailController.text,
            _passwordController.text,
          );
    }
    AuthState authState = context.read<AuthCubit>().state;
    if (authState is AuthSuccess) {
      Navigation.intentReplacement(HomeRoute);
    }
    if (authState is AuthFailed) {
      PopUpDialog.showErrorSnackbar(context, authState.message);
    }
    setState(() => _isSignInLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return BaseAuthPage(
      title: 'Sign In',
      subtitle: 'Sign In to Continue',
      isLoading: _isSignInLoading,
      contentBody: Expanded(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                title: 'Email address',
                iconAsset: 'assets/icon/icon_email.png',
                formField: TextFormField(
                  controller: _emailController,
                  validator: validateEmail,
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Your Email',
                    hintStyle: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              const SizedBox(height: defaultSpacing),
              CustomTextField(
                title: 'Password',
                iconAsset: 'assets/icon/icon_password.png',
                formField: TextFormField(
                  controller: _passwordController,
                  validator: (val) {
                    String? err = validatePassword(val);
                    if (err != null) {
                      setState(() => _errorMessage = err);
                    }
                    return null;
                  },
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Your Password',
                    hintStyle: Theme.of(context).textTheme.bodyText1,
                  ),
                  obscureText: !_isShowPassword,
                ),
                traillingIcon: IconButton(
                  onPressed: () {
                    setState(() => _isShowPassword = !_isShowPassword);
                  },
                  icon: Icon(
                    _isShowPassword ? Icons.visibility : Icons.visibility_off,
                    color: secondaryColor,
                  ),
                ),
              ),
              const SizedBox(height: defaultSpacing),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigation.intent(ForgotPasswordRoute);
                    },
                    child: Text('Forgot password?'),
                  ),
                ],
              ),
              const SizedBox(height: defaultSpacing),
              _errorMessage.isNotEmpty
                  ? Text(
                      _errorMessage,
                      style: TextStyle(color: Colors.red),
                    )
                  : SizedBox(),
              const SizedBox(height: defaultSpacing),
              const Spacer(),
              _buildButtonSignIn('Sign In', () {
                if (_formKey.currentState!.validate()) _signIn();
              }),
              const SizedBox(height: defaultSpacing),
              _buildButtonSignIn('Google', () => _signIn(isGoogleSignIn: true)),
              const SizedBox(height: defaultSpacing),
              _buildBottomContent(),
            ],
          ),
        ),
      ),
    );
  }
}
