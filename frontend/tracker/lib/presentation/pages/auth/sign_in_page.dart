import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tracker/common/style.dart';
import 'package:tracker/domain/router/router.dart';
import 'package:tracker/presentation/pages/auth/base_auth_page.dart';
import 'package:tracker/presentation/widgets/custom_text_field.dart';
import 'package:tracker/presentation/widgets/popup.dart';
import 'package:tracker/utils/navigation.dart';
import 'package:tracker/utils/validator.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool _isSignInLoading = false;

  CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _isSignInLoading = false;
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
              style: Theme.of(context).textTheme.bodyText1,
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
        onPressed: onPressed ?? null,
        child: Text(
          title,
          style: Theme.of(context).textTheme.button?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }

  void _signIn(Future<UserCredential> methodSignIn) async {
    String message = "";
    setState(() => _isSignInLoading = true);
    await methodSignIn.then((userCredential) {
      if (userCredential.user != null) {
        if (userCredential.user?.emailVerified != null) {
          _userCollection.doc(userCredential.user?.uid).update({
            "is_verified": userCredential.user?.emailVerified,
          }).catchError((err) => message = "Error verified user email");
        }
        Navigation.intentReplacement(HomeRoute);
      }
      message = "User Not Found";
    }).catchError(
      (err, stackTrace) {
        if (err.code == "user-not-found" || err.code == "wrong-password") {
          message = "Your Email Address or Password is invalid";
        }
        PopUpDialog.showErrorSnackbar(context, message);
      },
    );
    setState(() => _isSignInLoading = false);
  }

  Future<UserCredential> _signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> _signInEmailAndPassword() async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseAuthPage(
      title: "Sign In",
      subtitle: "Sign In to Continue",
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
                  validator: validateEmail,
                  controller: _emailController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Your Email',
                    hintStyle: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
              ),
              SizedBox(height: defaultSpacing),
              CustomTextField(
                title: 'Password',
                iconAsset: 'assets/icon/icon_password.png',
                formField: TextFormField(
                  controller: _passwordController,
                  validator: validatePassword,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Your Password',
                    hintStyle: Theme.of(context).textTheme.subtitle2,
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: defaultSpacing),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigation.intent(ForgotPasswordRoute);
                    },
                    child: Text("Forgot password?"),
                  ),
                ],
              ),
              SizedBox(height: defaultSpacing),
              Spacer(),
              _buildButtonSignIn('Sign In', () {
                if (_formKey.currentState!.validate())
                  _signIn(_signInEmailAndPassword());
              }),
              SizedBox(height: defaultSpacing),
              _buildButtonSignIn(
                'Google',
                () {
                  _signIn(_signInWithGoogle());
                },
              ),
              SizedBox(height: defaultSpacing),
              _buildBottomContent(),
            ],
          ),
        ),
      ),
    );
  }
}
