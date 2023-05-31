import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  Future<void> registerUser() async {
    final credencial =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailEC.text,
      password: _passwordEC.text,
    );

    // send a email to verificate the user
    credencial.user?.sendEmailVerification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de usuário'),
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
                onPressed: () => registerUser(),
                child: const Text('Cadastrar usuário'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
