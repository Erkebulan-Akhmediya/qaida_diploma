import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/profile/authorized.dart';
import 'package:qaida/profile/unauthorized.dart';
import 'package:qaida/providers/auth.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  Widget chooseProfile(isAuthorized) {
    return isAuthorized ? const Authorized() : const Unauthorized();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return chooseProfile(authProvider.isAuthorized);
  }
}