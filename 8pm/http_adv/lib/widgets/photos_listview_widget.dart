import 'package:flutter/material.dart';
import 'package:http_adv/bloc/photos_bloc.dart';
import 'package:http_adv/model/photo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotosListView extends StatefulWidget {
  const PhotosListView(
      {Key? key, required this.listData, required this.enableLoadMore})
      : super(key: key);
  final List<Photo> listData;
  final bool enableLoadMore;
  @override
  _PhotosListViewState createState() => _PhotosListViewState();
}

class _PhotosListViewState extends State<PhotosListView> {
  // var list = listData;

  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    scrollController.addListener(() {
      final position = scrollController.position;

      bool isAtEdge = position.atEdge;

      // position.pixels;

      // print(position.pixels);

      if (position.pixels >= position.maxScrollExtent && isAtEdge) {
        // i have reaced the end of screen
        if (widget.enableLoadMore == true) {
          context.read<PhotosCubit>().loadMorePosts();
        }

        print(position.maxScrollExtent);
        print("I am at the end");
      }

      if (isAtEdge && position.pixels <= position.minScrollExtent) {
        print("this is the min scroll: ${position.minScrollExtent}");
        print(" I am at the top ");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

        /// TODO: while using lazy load scroll view pacakge , comment the line below
        controller: scrollController,
        itemCount: widget.listData.length,
        itemBuilder: (context, index) {
          final currentPhoto = widget.listData[index];

          // print(currentPhoto.largeImageUrl);
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: FadeInImage(
                image: NetworkImage(currentPhoto.largeImageUrl),
                placeholder: AssetImage('assets/images/placeholder.png'),
                fadeInCurve: Curves.ease,
                fit: BoxFit.cover,
              ));
        });
  }
}
