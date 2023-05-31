import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  Future<void> loginUser() async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailEC.text,
      password: _passwordEC.text,
    );
    var message = '';
    final user = credential.user;

    if (user != null) {
      await user.updateDisplayName('Maimage.pngnel');

      if (kDebugMode) {
        print(user.displayName);
        print(user.email);
        print(user.emailVerified);
      }

      if (!user.emailVerified) {
        message = 'E-mail não confirmado, por favor, verifique o seu e-mail';
      } else {
        message = 'E-mail validado com sucesso';
      }
    }

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login de usuário'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _emailEC,
                decoration: const InputDecoration(label: Text('e-mail')),
              ),
              TextField(
                controller: _passwordEC,
                decoration: const InputDecoration(label: Text('senha')),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => loginUser(),
                child: const Text('Login usuário'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
