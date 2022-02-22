import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_adv/bloc/photos_bloc.dart';
import 'package:http_adv/bloc/photos_state.dart';
import 'package:logger/logger.dart';

import 'widgets/photos_listview_widget.dart';
import 'widgets/some_button.dart';

class HomepageWithCubit extends StatefulWidget {
  const HomepageWithCubit({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _HomepageWithCubitState createState() => _HomepageWithCubitState();
}

class _HomepageWithCubitState extends State<HomepageWithCubit> {
  final logger = Logger();
  final photosCubit = new PhotosCubit();

  /// streams
  // string
  // stream = continous flow

// source , sink

  @override
  Widget build(BuildContext context) {
    print("build called");
    final width = MediaQuery.of(context).size.width;

    /// TODO: do not call set state inside build function or inside buidler directly
    // setState(() {});

    return Scaffold(
        appBar: AppBar(),
        body:
            BlocListener<PhotosCubit, PhotosState>(listener: (context, state) {
          if (state is SuccessState) {
            print("set state called");

            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (_) => Scaffold()));
          }
        }, child: BlocBuilder<PhotosCubit, PhotosState>(
          // bloc: photosCubit,
          builder: (context, state) {
            print(state);

            if (state is LoadingState) return Center(child: CircularProgressIndicator());

            if (state is ErrorState) {
              return Text(state.errorMessage,
                  style: TextStyle(color: Colors.red));
            }

            if (state is SuccessState) {
              return PhotosListView(listData: state.data);
            }

            return MaterialButton(
              color: Colors.greenAccent,
              onPressed: () {
                // photosCubit.fetchPosts();
                context.read<PhotosCubit>().fetchPosts();
                // BlocProvider.of<PhotosCubit>(context).fetchPosts();

                // Theme.of(context);
                // Navigator.of(context).push(route);
              },
              child: Text("Fetch data from server"),
            );
          },
        )));
  }
}
