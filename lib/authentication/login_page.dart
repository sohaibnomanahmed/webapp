import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _firstname = '';
  String _lastname = '';
  String _email = '';
  String _password = '';
  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    final isLoading = false;
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
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
                            decoration: const InputDecoration(hintText: 'Lastname'),
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
