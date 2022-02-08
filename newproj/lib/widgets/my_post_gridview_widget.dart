import "package:flutter/material.dart";

class MyPostsGridViewWidget extends StatelessWidget {
  MyPostsGridViewWidget({Key? key}) : super(key: key);
  final postImage =
      "https://cdn.pixabay.com/photo/2021/11/06/16/11/greece-6773683_960_720.jpg";

  final List posts = [
    "Beautiful photo",
    "second photo",
    "third photo",
    " fourth photo",
    " 5th photo",
    " 6th photo",
    " 7th photo",
    " photo"
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        print(index);
        final currentPost = posts[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                              height: 100,
                              child: Center(child: Text("This is a dialog"))),
                        );
                      });
                },
                child: Image.network(
                  postImage,
                  fit: BoxFit.cover,
                  // height: 10,
                  // width: 200,
                ),
              ),
              SizedBox(height: 8),
              InkWell(
                onTap: () {
                  final chosenDate = showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2021),
                      lastDate: DateTime(2050));

                  // showModalBottomSheet(
                  //     context: context,
                  //     builder: (context) {
                  //       return Container(
                  //         height: 500,
                  //         color: customGreen,
                  //       );
                  //     });
                },
                child: Text(
                  currentPost,
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.6,
      ),
    );
  }
}
