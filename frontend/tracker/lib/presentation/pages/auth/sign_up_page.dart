import 'package:flutter/material.dart';
import 'package:tracker/common/style.dart';
import 'package:tracker/domain/entity/user_entity.dart';
import 'package:tracker/domain/router/router.dart';
import 'package:tracker/presentation/cubit/auth/auth_cubit.dart';
import 'package:tracker/presentation/pages/auth/base_auth_page.dart';
import 'package:tracker/presentation/widgets/custom_text_field.dart';
import 'package:tracker/utils/navigation.dart';
import 'package:tracker/utils/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _fullnameController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool _isSignUpLoading = false;

  @override
  void initState() {
    super.initState();
    _isSignUpLoading = false;
  }

  @override
  void dispose() {
    _fullnameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _isSignUpLoading = false;
    super.dispose();
  }

  Widget _buildBottomContent() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have an account',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Sign In',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSignUpLoading = true);
      UserEntity userData = UserEntity(
        fullname: _fullnameController.text,
        email: _emailController.text,
        username: _usernameController.text,
        password: _passwordController.text,
        imageURL: "",
        isVerified: false,
      );
      await context.read<AuthCubit>().signUp(userData);
      final AuthState authState = context.read<AuthCubit>().state;
      setState(() => _isSignUpLoading = false);
      if (authState is AuthSuccess) {
        Navigation.intentReplacement(HomeRoute);
      }
    }
  }

  Widget _buildButtonSignUp() {
    return Container(
      height: defaultPadding * 3,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _handleSignUp,
        child: Text(
          'Sign Up',
          style: Theme.of(context).textTheme.button?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorMessage() {
    return Row(
      children: [
        Expanded(
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthFailed) {
                return Text(
                  state.message,
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: Colors.red,
                      ),
                );
              }
              return SizedBox();
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseAuthPage(
      title: "Sign Up",
      subtitle: "Register and Plan Your Dream",
      isLoading: _isSignUpLoading,
      contentBody: Expanded(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextField(
                  title: 'Fullname',
                  iconAsset: 'assets/icon/icon_name.png',
                  formField: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _fullnameController,
                    validator: validateName,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Your fullname',
                      hintStyle: Theme.of(context).textTheme.subtitle2,
                    ),
                  )),
              SizedBox(height: defaultSpacing),
              CustomTextField(
                  title: 'Username',
                  iconAsset: 'assets/icon/icon_username.png',
                  formField: TextFormField(
                    keyboardType: TextInputType.name,
                    validator: validateUsername,
                    controller: _usernameController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Your username',
                      hintStyle: Theme.of(context).textTheme.subtitle2,
                    ),
                  )),
              SizedBox(height: defaultSpacing),
              CustomTextField(
                  title: 'Email Address',
                  iconAsset: 'assets/icon/icon_email.png',
                  formField: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                    controller: _emailController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Your email address',
                      hintStyle: Theme.of(context).textTheme.subtitle2,
                    ),
                  )),
              SizedBox(height: defaultSpacing),
              CustomTextField(
                  title: 'Password',
                  iconAsset: 'assets/icon/icon_password.png',
                  formField: TextFormField(
                    obscureText: true,
                    validator: validatePassword,
                    controller: _passwordController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Your password',
                      hintStyle: Theme.of(context).textTheme.subtitle2,
                    ),
                  )),
              SizedBox(height: defaultSpacing),
              _buildErrorMessage(),
              SizedBox(height: defaultSpacing),
              Spacer(),
              _buildButtonSignUp(),
              _buildBottomContent(),
            ],
          ),
        ),
      ),
    );
  }
}
