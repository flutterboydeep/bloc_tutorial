import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/Screen/favirotePage.dart';
import 'package:learn_bloc/bloc/fav_bloc.dart';
import 'package:learn_bloc/r_model/favModel.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    context.read<FavBloc>().add(FetchFavourite());
  }

  checkbox(state, item) {
    return Checkbox(
      value: state.showdeleteCheckBox.contains(item) ? true : false,
      onChanged: (newValue) {
        if (newValue == true) {
          context.read<FavBloc>().add(SelcteCheckboxItemEvent(fmodel: item));
        } else {
          context.read<FavBloc>().add(UnselcteCheckboxItemEvent(fmodel: item));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favirote Item"),
        actions: [
          BlocBuilder<FavBloc, FavInitial>(
            builder: (context, state) {
              return state.showdeleteCheckBox.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        context.read<FavBloc>().add(DeleteItemEvent());
                      },
                      icon: Icon(Icons.delete),
                    )
                  : TextButton(
                      onPressed: () {
                        context.read<FavBloc>().add(IsCheckboxEvent());
                      },
                      child: Text("Edit"),
                    );
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FavirotePage()));
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: BlocBuilder<FavBloc, FavInitial>(builder: (context, state) {
        switch (state.listStatus) {
          case ListStatus.loading:
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );

          case ListStatus.failure:
            return Center(
              child: Text("Some Error Occured"),
            );

          case ListStatus.Initial:
            return Center(child: CircularProgressIndicator());

          case ListStatus.success:
            return ListView.builder(
              itemCount: state.favItemList.length,
              itemBuilder: (context, index) {
                final item = state.favItemList[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      leading: state.isCheckbox == true
                          ? checkbox(state, item)
                          : SizedBox(
                              height: 0,
                            ),
                      title: Text(item.value),
                      trailing: IconButton(
                        onPressed: () {
                          FavModel objFavModel = FavModel(
                              id: item.id,
                              value: item.value,
                              isFavourite:
                                  item.isFavourite == true ? false : true);
                          BlocProvider.of<FavBloc>(context)
                              .add(favIconEvent(item: objFavModel));

                          BlocProvider.of<FavBloc>(context)
                              .add(nextScreenFavEvent(
                            isfav: item.isFavourite,
                            id: item.id,
                            value: item.value,
                          ));
                        },
                        icon: Icon(state.favItemList[index].isFavourite == true
                            ? Icons.favorite
                            : Icons.favorite_border),
                      ),
                    ),
                  ),
                );
              },
            );
        }
      }),
    );
  }
}
