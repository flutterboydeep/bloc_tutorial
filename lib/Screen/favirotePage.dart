import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/fav_bloc.dart';
import 'package:learn_bloc/r_model/favModel.dart';

class FavirotePage extends StatelessWidget {
  FavirotePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<dynamic> data =
    //     BlocProvider.of<FavBloc>(context).;
    // print(data);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favirote Item"),
      ),
      body: BlocBuilder<FavBloc, FavInitial>(
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: ((context, index) {
              final item = state.showFavModel[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    leading: Text(item.id),
                    title: Text(state.showFavModel[index].value),
                    trailing: IconButton(
                        onPressed: () {
                          BlocProvider.of<FavBloc>(context).add(
                              nextScreenFavRemoveEvent(
                                  id: item.id,
                                  value: item.value,
                                  isfav: item.isFavourite == item.isFavourite,
                                  fmodel: FavModel(
                                      id: item.id,
                                      value: item.value,
                                      isFavourite: item.isFavourite == true
                                          ? false
                                          : true)));
                        },
                        icon: Icon(Icons.close_rounded)),
                  ),
                ),
              );
            }),
            itemCount: state.showFavModel.length,
          );
        },
      ),
    );
  }
}
