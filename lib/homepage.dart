import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/auth_bloc.dart';
import 'package:learn_bloc/enterNewpage.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  TextEditingController mailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    log("I am re run again");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
          if (state is AuthSuccess) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EnterNewPage()));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide(width: 2)),
                    ),
                    controller: mailCtrl,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide(width: 2)),
                    ),
                    controller: passCtrl,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 192, 170, 229)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)))),
                        onPressed: () {
                          context.read<AuthBloc>().add(AuthSignInRequest(
                              Email: mailCtrl.text.trim(),
                              Password: passCtrl.text.trim()));
                          // BlocProvider.of<AuthBloc>(context).add(
                          //     AuthSignInRequest(
                          // Email: mailCtrl.text.trim(),
                          // Password: passCtrl.text.trim()));
                        },
                        child: Text("Add")),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EnterNewPage()));
                      },
                      child: Text("next"))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
