import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/widget_bloc.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BlocBuilder<WidgetBloc, InitialState>(
                    builder: (context, state) {
                  if (state.isSwitch) {
                    return Text("Notification On");
                  } else {
                    return Text("Notification Off");
                  }
                }),
                BlocBuilder<WidgetBloc, InitialState>(
                    buildWhen: (previous, current) {
                  return previous.isSwitch != current.isSwitch;
                }, builder: (context, state) {
                  log(" switch widget");
                  return Switch(
                    value: state.isSwitch,
                    onChanged: (newValue) {
                      context.read<WidgetBloc>().add(OnOffNotificationEvent());
                    },
                  );
                }),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            BlocBuilder<WidgetBloc, InitialState>(
                buildWhen: (previous, current) {
              return previous.slider != current.slider;
            }, builder: (context, state) {
              log('container rerun');
              return Container(
                  height: 200,
                  width: 200,
                  color: Colors.blue.withOpacity(state.slider));
            }),
            SizedBox(
              height: 20,
            ),
            BlocBuilder<WidgetBloc, InitialState>(builder: (context, state) {
              return Slider(
                value: state.slider,
                onChanged: (newValue) {
                  log(" Slider widget ");

                  BlocProvider.of<WidgetBloc>(context)
                      .add(SliderEvent(sliderValue: newValue));
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
