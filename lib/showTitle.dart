import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/addTitle_cubit.dart';
import 'package:learn_bloc/cubit/models/addTitle_models.dart';

class showTitle extends StatelessWidget {
  const showTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Added title")),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: BlocBuilder<AddTitle_cubit, List<AddTitle_maodels>>(
            builder: (context, stat) {
          return ListView.builder(
              itemBuilder: (context, index) {
                final Data = stat[index];
                print("i am Statex ${stat[index]}");
                return Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    tileColor: Colors.yellow.shade300,
                    title: Text(Data.titles),
                    trailing: Text(Data.Created_At),
                  ),
                );
              },
              itemCount: stat.length);
        }),
      ),
    );
  }
}
