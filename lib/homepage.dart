import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/addTitle_cubit.dart';
import 'package:learn_bloc/showTitle.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:learn_bloc/bloc/counter_bloc.dart';
// import 'package:learn_bloc/cubit/AdderPart.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  TextEditingController titleCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final counterCubit = BlocProvider.of<CounterCubit>(context);
    // final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(hintText: 'Enter some Title'),
                controller: titleCtrl,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 192, 170, 229)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)))),
                onPressed: () {
                  // context
                  //     .read<AddTitle_cubit>()
                  BlocProvider.of<AddTitle_cubit>(context)
                      .addTitle(titleCtrl.text.trim().toString());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => showTitle(),
                    ),
                  );
                },
                child: Text("Add"))
          ],
        ),
      ),
    );
  }
}
