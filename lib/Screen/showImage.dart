import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/image_bloc.dart';
import 'package:learn_bloc/bloc/image_state.dart';

class ShowImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: Text("show Image"),
        ),
        body: Center(
          child: BlocBuilder<ImageBloc, InitialImageState>(
              builder: (context, state) {
            if (state.file != null) {
              return Image.file(File(state.file!.path.toString()));
            } else {
              return Center(
                child: Text("Image Not found"),
              );
            }
          }),
        )));
  }
}
