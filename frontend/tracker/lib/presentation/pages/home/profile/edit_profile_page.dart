import 'package:flutter/material.dart';
import 'package:tracker/di/injector.dart';
import 'package:tracker/presentation/cubit/auth/auth_cubit.dart';
import 'package:tracker/presentation/widgets/custom_text_field.dart';
import 'package:tracker/utils/validator.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late String _profilePictureURL;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    AuthSuccess stateAuth = injector<AuthCubit>().state as AuthSuccess;
    _profilePictureURL = stateAuth.user.imageURL;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Widget _buildFormEdit() {
    return Container(
      child: Column(
        children: [
          CustomTextField(
            title: 'Name',
            formField: TextFormField(
              controller: _nameController,
              validator: validateName,
            ),
          ),
          CustomTextField(
            title: 'Email',
            formField: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: validateEmail,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: _profilePictureURL.isEmpty
                  ? Image.asset('assets/image/splash.png').image
                  : NetworkImage(_profilePictureURL),
            ),
            const Divider(),
            _buildFormEdit(),
            const SizedBox(height: 18),
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
