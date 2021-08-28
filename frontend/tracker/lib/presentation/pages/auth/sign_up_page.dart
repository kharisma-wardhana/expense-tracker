import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracker/common/style.dart';
import 'package:tracker/domain/router/router.dart';
import 'package:tracker/presentation/pages/auth/base_auth_page.dart';
import 'package:tracker/presentation/widgets/custom_text_field.dart';
import 'package:tracker/utils/navigation.dart';
import 'package:tracker/utils/validator.dart';

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
  String _errorMessage = "";
  CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _fullnameController.dispose();
    _usernameController.dispose();
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

  Widget _buildButtonSignUp() {
    return Container(
      height: defaultPadding * 3,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            String message = "";
            setState(() {
              _isSignUpLoading = true;
              _errorMessage = message;
            });
            try {
              UserCredential userCredential =
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text,
              );
              userCredential.user?.sendEmailVerification();
              if (userCredential.user != null) {
                _userCollection
                    .doc(userCredential.user?.uid)
                    .set({
                      "username": _usernameController.text,
                      "fullname": _fullnameController.text,
                      "email": _emailController.text,
                      "is_verified": userCredential.user?.emailVerified,
                      "balance": 0,
                      "income": 0,
                      "spend": 0,
                    })
                    .then((value) => Navigation.intentReplacement(HomeRoute))
                    .catchError((error) => print(error.toString()));
              }
            } on FirebaseAuthException catch (err) {
              message = err.message ?? err.code;
            } catch (err) {
              message = err.toString();
            }
            setState(() {
              _errorMessage = message;
              _isSignUpLoading = false;
            });
          }
        },
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
          child: Text(
            _errorMessage,
            style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  color: Colors.red,
                ),
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
              _errorMessage.isEmpty ? SizedBox() : _buildErrorMessage(),
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
