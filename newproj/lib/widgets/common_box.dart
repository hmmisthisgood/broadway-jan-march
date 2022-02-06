import 'package:flutter/material.dart';

class CommonBox extends StatelessWidget {
  const CommonBox({Key? key, this.height}) : super(key: key);
  final height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("I am tapped");
      },
      child: Container(
          height: 400,
          margin: EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.green, width: 2)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Height of the screen is : $height"),
              Text("Height of the screen is : $height"),
              Container(
                // width: 100,
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.home),
                    Icon(Icons.access_alarm),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
