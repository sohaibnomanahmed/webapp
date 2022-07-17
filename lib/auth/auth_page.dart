import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_provider.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String _firstname = '';
  String _lastname = '';
  String _email = '';
  String _password = '';
  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<AuthProvider>().isLoading;
    return Scaffold(
      appBar: AppBar(
          title: _isLogin ? const Text("Login") : const Text('Create Account')),
      body: Center(
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: SizedBox(
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/logo.png'),
                  const SizedBox(height: 20),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: _isLogin ? 0 : 95,
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          TextField(
                            decoration:
                                const InputDecoration(hintText: 'Firstname'),
                            keyboardType: TextInputType.name,
                            autofocus: true,
                            onChanged: (value) => _firstname = value,
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            decoration:
                                const InputDecoration(hintText: 'Lastname'),
                            keyboardType: TextInputType.name,
                            onChanged: (value) => _lastname = value,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: const InputDecoration(hintText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
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
                    style: TextButton.styleFrom(
                        minimumSize: const Size.fromHeight(48)),
                    onPressed: isLoading
                        ? null
                        : () async {
                            final scaffold = ScaffoldMessenger.of(context);
                            final theme = Theme.of(context);
                            if (_isLogin) {
                              final res = await context
                                  .read<AuthProvider>()
                                  .signIn(email: _email, password: _password);
                              scaffold.showSnackBar(SnackBar(
                                  content: Text(res.item2),
                                  backgroundColor: res.item1
                                      ? Colors.teal
                                      : theme.errorColor));
                              // if(res.item1){
                              //   Navigator.of(context).pop();
                              // }
                            } else {
                              final res = await context
                                  .read<AuthProvider>()
                                  .createUser(
                                      firstname: _firstname,
                                      lastname: _lastname,
                                      email: _email,
                                      password: _password);
                              scaffold.showSnackBar(SnackBar(
                                  content: Text(res.item2),
                                  backgroundColor: res.item1
                                      ? Colors.teal
                                      : theme.errorColor));        
                            }
                          },
                    child: _isLogin
                        ? const Text('Login')
                        : const Text('Create Account'),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    style: TextButton.styleFrom(
                        minimumSize: const Size.fromHeight(48)),
                    onPressed: () => setState(() {
                      _isLogin = !_isLogin;
                    }),
                    child: _isLogin
                        ? const Text('Create Account')
                        : const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
