import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  String _email = '';
  String _password = '';

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = false;
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(child: Container(
        width: 400,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/logo.png'),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(hintText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                autofocus: true,
                onChanged: (value) => _email = value,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(hintText: 'Password'),
                obscureText: true,
                onChanged: (value) => _password = value,
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password'),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: TextButton.styleFrom(minimumSize: const Size.fromHeight(40)),
                onPressed: isLoading
                    ? null
                    : () async {
                        // final res = await context
                        //     .read<LoginProvider>()
                        //     .signIn(email: _email, password: _password);
                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //     content: Text(res.item2),
                        //     backgroundColor: res.item1
                        //         ? Colors.teal
                        //         : Theme.of(context).errorColor));
                        // if(res.item1){
                        //   Navigator.of(context).pop();
                        // }   
                      },
                child: const Text('Login'),
              ),
            ],
          ),
      ),),
    );
  }
}