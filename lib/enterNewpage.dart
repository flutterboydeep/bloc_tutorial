import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/api_bloc.dart';
import 'package:learn_bloc/models/productModel.dart';

class EnterNewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  final ApiState = context.watch<ApiBloc>().state as AuthSuccess;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi I am new page"),
      ),
      body: BlocBuilder<ApiBloc, ApiState>(
        builder: (context, state) {
          if (state is ApiLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ApiFailureState) {
            return Center(
              child: Text("some error occured"),
            );
          }
          if (state is ApiLoadedState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(
                            state.productModel[index].image.toString())),
                    title: Text(state.productModel[index].category.toString()),
                    trailing: Text(
                        state.productModel[index].rating!.count.toString() +
                            "👍"),
                  ),
                );
              },
              itemCount: state.productModel.length,
            );
          }
          return Center(child: Text("Some Error Occured"));
        },
      ),
    );
  }
}
