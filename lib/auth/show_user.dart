import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ShowUser extends StatefulWidget {
  const ShowUser({Key? key}) : super(key: key);

  @override
  State<ShowUser> createState() => _ShowUserState();
}

class _ShowUserState extends State<ShowUser> {
  User? _user;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show user'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_user?.displayName ?? ''),
            Text(_user?.email ?? ''),
            Text(_user?.photoURL ?? ''),
            TextButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              child: const Text('Sair'),
            ),
          ],
        ),
      ),
    );
  }
}
