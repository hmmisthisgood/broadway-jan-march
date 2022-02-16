import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:http_basics/model/post.dart';

class CommonPostWidget extends StatelessWidget {
  CommonPostWidget({Key? key, required this.post}) : super(key: key);

  final userImage =
      "https://www.bkacontent.com/wp-content/uploads/2020/10/Depositphotos_336730000_l-2015.jpg";
  final postImage =
      "https://cdn.pixabay.com/photo/2021/11/06/16/11/greece-6773683_960_720.jpg";
  final Post post;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    print("Building a post ");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: Image.network(userImage, fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      post.id.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 500,
                          color: Colors.green,
                        );
                      },
                    );
                  },
                  child: Icon(Icons.more_horiz),
                ),
              ]),
        ),
        GestureDetector(
          onDoubleTap: () {
            print("I am liked with double tap");
          },
          child: Container(
            height: 500,
            child: Image.network(
              postImage,
              width: screenWidth,
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onLongPress: () {
                      print("I am long pressed");
                    },
                    child: Icon(
                      Icons.favorite_border,
                      size: 35,
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      print("I am pressed with GEsture detector");
                    },
                    child: Icon(
                      Fontisto.comment,
                      size: 32,
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      print("I am pressed with Inkwell");
                    },
                    child: Icon(
                      Feather.send,
                      size: 32,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Feather.send,
                      size: 32,
                    ),
                    onPressed: () {
                      print("send pressed from Icon button");
                    },
                  )
                ],
              ),
              Icon(
                FontAwesome.bookmark_o,
                size: 35,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(post.title, style: TextStyle(fontSize: 16)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(post.body,
              style: TextStyle(fontSize: 14, color: Colors.grey)),
        )
      ],
    );
  }
}
