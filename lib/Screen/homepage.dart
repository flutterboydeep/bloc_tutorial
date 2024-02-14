import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/Screen/showImage.dart';
import 'package:learn_bloc/bloc/image_bloc.dart';
import 'package:learn_bloc/bloc/image_event.dart';
import 'package:learn_bloc/bloc/image_state.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var rangeValue = 0.0;

  @override
  Widget build(BuildContext context) {
    log("I am re run again");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: [
          BlocBuilder<ImageBloc, InitialImageState>(
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  showDialogBox();
                },
                child: Icon(
                  Icons.file_upload,
                  size: 100,
                  color: Colors.green,
                ),
              );

              // }
              // return Image.file(File(state.file!.path.toString()));
            },
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShowImage()));
              },
              child: Text("Show Image Screen"))
        ]),
      ),
    );
  }

  void showDialogBox() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Picked Image"),
            content: Text("Choose Your Image From"),
            actions: [
              TextButton(
                onPressed: () {
                  context.read<ImageBloc>().add(GalleryModeEvent());
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShowImage()));
                },
                child: Text("Gallery"),
              ),
              TextButton(
                onPressed: () {
                  context.read<ImageBloc>().add(GalleryModeEvent());

                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShowImage()));
                },
                child: Text("Camera"),
              )
            ],
          );
        });
  }
}
