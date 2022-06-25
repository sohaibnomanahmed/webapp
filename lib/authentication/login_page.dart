import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        width: 500,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //const SizedBox(height: 20),
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
              Container(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password'),
                ),
              ),
              ElevatedButton(
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
              )
            ],
          ),
      ),),
    );
  }
}