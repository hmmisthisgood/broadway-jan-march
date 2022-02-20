import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_adv/bloc/photos_bloc.dart';
import 'package:http_adv/bloc/photos_state.dart';
import 'package:logger/logger.dart';

class HomepageWithCubit extends StatefulWidget {
  const HomepageWithCubit({Key? key}) : super(key: key);

  @override
  _HomepageWithCubitState createState() => _HomepageWithCubitState();
}

class _HomepageWithCubitState extends State<HomepageWithCubit> {
  final logger = Logger();
  final photosCubit = new PhotosCubit();

  /// streams

  @override
  Widget build(BuildContext context) {
    print("build called");
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder(
          bloc: photosCubit,
          builder: (context, PhotosState state) {
            print(state);

            if (state is LoadingState) return CircularProgressIndicator();
            if (state is ErrorState) {
              return Text(state.errorMessage,
                  style: TextStyle(color: Colors.red));
            }

            if (state is SuccessState)
              return Text(state.data, style: TextStyle(color: Colors.green));

            return MaterialButton(
              color: Colors.greenAccent,
              onPressed: () {
                photosCubit.fetchPosts();
              },
              child: Text("Fetch data from server"),
            );
          },
        )
      ],
    ));
  }
}
