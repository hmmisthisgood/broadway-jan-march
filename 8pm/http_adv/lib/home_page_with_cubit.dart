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
  /// source , sink

  bool isLoadingMore = false;
  bool enableLoadMore = true;

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("build called");
    final width = MediaQuery.of(context).size.width;

    /// TODO: do not call set state inside build function or inside buidler directly
    // setState(() {});

    return Scaffold(
        appBar: AppBar(),
        body: BlocListener<PhotosCubit, PhotosState>(
            listener: (context, state) {
              if (state is LoadingMoreState) {
                isLoadingMore = true;
                setState(() {});
              }

              if (state is SuccessState) {
                print("set state called");

                if (isLoadingMore == true) {
                  isLoadingMore = false;
                  setState(() {});
                }

                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (_) => Scaffold()));
              }

              if (state is NoMoreData) {
                enableLoadMore = false;
                setState(() {});
              }
            },
            child: Column(
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: searchController,
                    textInputAction: TextInputAction.search,
                    onFieldSubmitted: (value) {
                      context
                          .read<PhotosCubit>()
                          .fetchPosts(searchController.text);
                    },
                    decoration: InputDecoration(
                        hintText: "Search for photos",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(26),
                        )),
                  ),
                ),
                MaterialButton(
                  color: Colors.greenAccent,
                  onPressed: () {
                    // photosCubit.fetchPosts();
                    context
                        .read<PhotosCubit>()
                        .fetchPosts(searchController.text);
                    // BlocProvider.of<PhotosCubit>(context).fetchPosts();

                    // Theme.of(context);
                    // Navigator.of(context).push(route);
                  },
                  child: Text("Search"),
                ),
                BlocBuilder<PhotosCubit, PhotosState>(
                  // bloc: photosCubit,
                  builder: (context, state) {
                    print(state);

                    if (state is LoadingState) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is ErrorState) {
                      return Text(state.errorMessage,
                          style: TextStyle(color: Colors.red));
                    }

                    if (state is SuccessState ||
                        state is LoadingMoreState ||
                        state is NoMoreData) {
                      return Expanded(
                          child: PhotosListView(
                              listData: state.data,
                              enableLoadMore: enableLoadMore));
                    }
                    return Container();
                    // if (state is LoadingMoreState) {
                    //   return Column(
                    //     children: [
                    //       Expanded(child: PhotosListView(listData: state.data)),
                    //       CircularProgressIndicator()
                    //     ],
                    //   );
                    // }
                  },
                ),
                if (isLoadingMore) CircularProgressIndicator()
              ],
            )));
  }
}
