import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class CommonPostWidget extends StatelessWidget {
  const CommonPostWidget(
      {Key? key, required this.userImage, required this.postImage})
      : super(key: key);

  final String userImage;
  final String postImage;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
                      "glitterglue",
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
          child: Text("Beautifyl Sea", style: TextStyle(fontSize: 16)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text("View all comments",
              style: TextStyle(fontSize: 14, color: Colors.grey)),
        )
      ],
    );
  }
}
