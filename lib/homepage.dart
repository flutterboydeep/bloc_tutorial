import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/api_bloc.dart';

import 'package:learn_bloc/enterNewpage.dart';

// ignore: must_be_immutable
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
      body: Center(
        child: ElevatedButton(
          child: Text("Fatch Data"),
          onPressed: () {
            BlocProvider.of<ApiBloc>(context).add(FatchDataEvent());
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EnterNewPage()));
          },
        ),
      ),
    );
  }
}
