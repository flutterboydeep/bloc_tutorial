import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/api_bloc.dart';
import 'package:learn_bloc/data/data_provider/api_data_provider.dart';

import 'package:learn_bloc/homepage.dart';
import 'package:learn_bloc/data/repository/product_repo.dart';
import 'package:learn_bloc/models/productModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ProductRepo(ApiDataProvider()),
      child: BlocProvider(
        create: (context) => ApiBloc(context.read<ProductRepo>()),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 97, 6, 255)),
            useMaterial3: true,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}
