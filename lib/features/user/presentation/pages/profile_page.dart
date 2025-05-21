import 'package:flutter/material.dart';
import 'package:linkifoot/features/user/domain/entities/user_entity.dart';

class ProfilePage extends StatelessWidget {
  final UserEntity currentUser;
  const ProfilePage({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Center(
        child: Text('Welcome to the Profile Page!'),
      ),
    );
  }
}
