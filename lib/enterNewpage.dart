import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/auth_bloc.dart';
import 'package:learn_bloc/homepage.dart';

class EnterNewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  final authState = context.watch<AuthBloc>().state as AuthSuccess;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi I am new page"),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: ((context, state) {
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(
                    title: "appBar",
                  ),
                ),
                (route) => false);
          }
        }),
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AuthFailure) {
            return Center(child: Text("some Error Occured"));
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text((state as AuthSuccess).uid),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(
                          AuthSignOutRequest()); // to add and event, what event will be occured after onPress
                    },
                    child: Text("Log Out")),
              ],
            ),
          );
        },
      ),
    );
  }
}
