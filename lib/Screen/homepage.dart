import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/todoListEvent.dart';
import 'package:learn_bloc/bloc/todoList_bloc.dart';
import 'package:learn_bloc/bloc/todoList_state.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController UpdatetitleController = TextEditingController();
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    log("I am re run again");
    var ind;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocBuilder<TodoListBloc, TodoListState>(
          //     buildWhen: (previous, currrent) {
          //   return previous.Addtitle != currrent.Addtitle;
          // },
          builder: (context, state) {
        return ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Card(
                  color: Color.fromARGB(255, 31, 32, 33),
                  elevation: 7,
                  child: ListTile(
                    tileColor: Color.fromARGB(255, 240, 235, 155),
                    leading: Text("$index"),
                    title: Text(state.Addtitle[index]),
                    subtitle: Text(
                        "${now.day}/${now.month}/${now.year}  ${now.hour}:${now.minute}:${now.second}"),
                    trailing: threeDot(index, state.Addtitle[index]),
                  ),
                ),
              );
            },
            itemCount: state.Addtitle.length);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialogBox();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void showDialogBox() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Enter Some Title"),
            content: TextField(
              controller: titleController,
              maxLength: 50,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  BlocProvider.of<TodoListBloc>(context).add(AddTitleEvent(
                      title: titleController.text.trim().toString()));
                  // context.read<TodoListBloc>().add(AddTitleEvent(
                  //     title: titleController.text.trim().toString()));
                  titleController.clear();
                  Navigator.of(context).pop();
                },
                child: Text("Okk"),
              )
            ],
          );
        });
  }

  threeDot<Widget>(int ListTileIndex, String title) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 0,
            child: Text("Edit"),
          ),
          PopupMenuItem(
            value: 1,
            child: Text("Delete"),
          ),
        ];
      },
      onSelected: (ItemSelected) {
        selectedThreeDotItem(context, ItemSelected, ListTileIndex, title);
      },
    );
  }

  void selectedThreeDotItem(context, popubItemSelected, ListTileIndex, title) {
    switch (popubItemSelected) {
      case 0:
        upDateDialogBox(ListTileIndex, title);

        break;
      case 1:
        BlocProvider.of<TodoListBloc>(context)
            .add(DeletTitleEvent(DelIndex: ListTileIndex));

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("$title Successfully Deleted !")));
        break;
    }
  }

  void upDateDialogBox(int ListTileIndex, String title) async {
    UpdatetitleController.text = title;
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Update Title"),
            content: BlocBuilder<TodoListBloc, TodoListState>(
                builder: (context, state) {
              return TextField(
                controller: UpdatetitleController,
                maxLength: 50,
              );
            }),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  BlocProvider.of<TodoListBloc>(context).add(UpdateTitleEvent(
                      UpdateTitle: UpdatetitleController.text.trim(),
                      updateIndex: ListTileIndex));
                  ;
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("$title Successfully Updated !")));
                  UpdatetitleController.clear();

                  Navigator.of(context).pop();
                },
                child: Text("Update"),
              )
            ],
          );
        });
  }
}
