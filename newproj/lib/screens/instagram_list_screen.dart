import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newproj/widgets/common_post_widget.dart';

class InstagramListScreen extends StatelessWidget {
  final userImage =
      "https://www.bkacontent.com/wp-content/uploads/2020/10/Depositphotos_336730000_l-2015.jpg";
  final postImage =
      "https://cdn.pixabay.com/photo/2021/11/06/16/11/greece-6773683_960_720.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Entypo.camera,
          color: Colors.black,
          size: 30,
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text("Instagram",
            style: GoogleFonts.dancingScript(
              textStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Icon(
                  Icons.tv_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                Positioned(
                  right: 0,
                  // top: 2,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                  ),
                )
              ],
            ),
          ),
          Container(
            // color: Colors.green,
            width: 60,
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Feather.send,
                      color: Colors.black,
                      size: 30,
                    )),
                Positioned(
                  right: 0,
                  child: Container(
                    height: 25,
                    width: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    child: Text(
                      "3",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body:

          //  Column(
          //   children: [
          //     // Container(
          //     //   child: Stack(
          //     //     children: [
          //     //       Container(
          //     //         height: 500,
          //     //         // width: 200,
          //     //         color: Colors.black.withOpacity(0.8),
          //     //       ),
          //     //       Container(
          //     //         color: Colors.red,
          //     //         height: 500,
          //     //         child: Image.network(postImage),
          //     //       ),
          //     //       Positioned(top: 10, child: Icon(Icons.home, size: 45)),
          //     //     ],
          //     //   ),
          //     // )
          //   ],
          // )

          ListView(
        children: [
          CommonPostWidget(userImage: userImage, postImage: postImage),
          CommonPostWidget(userImage: userImage, postImage: postImage),
          CommonPostWidget(userImage: userImage, postImage: postImage),
          CommonPostWidget(userImage: userImage, postImage: postImage),
          CommonPostWidget(userImage: userImage, postImage: postImage),
          CommonPostWidget(userImage: userImage, postImage: postImage),
        ],
      ),
    );
  }
}
