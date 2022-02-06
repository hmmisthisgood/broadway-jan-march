import 'package:flutter/material.dart';
import 'package:newproj/widgets/common_box.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  Widget buildABox(double height) {
    return Container(
      height: 400,
      margin: EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          // color: Colors.w,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.green, width: 2)),
      child: Text("Height of the screen is : $height"),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);

    return Scaffold(
        drawer: Drawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        appBar: AppBar(
          title: Text(
            "This is title",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              letterSpacing: 3,
            ),
          ),
        ),
        body: SafeArea(
            top: true,
            child: Container(
              child: ListView(
                children: [
                  Text("Height of the screen is : $height"),
                  SizedBox(height: 20),
                  Text("Height of the screen is : $height"),
                  SizedBox(height: 20),
                  Text("Height of the screen is : $height"),
                  SizedBox(height: 20),
                  Text("Height of the screen is : $height"),
                  SizedBox(height: 20),
                  CommonBox(height: height),
                  CommonBox(height: height),
                  CommonBox(height: height),
                  CommonBox(height: height),
                  CommonBox(height: height),
                  CommonBox(height: height),
                  CommonBox(height: height),
                  CommonBox(height: height),
                  CommonBox(height: height),
                ],
              ),
            )));
  }
}

// Container = Simply a box (equivalnet of div)
// Scaffold =  To create a new screen (provides basic structure to a screen )
// Column = For creating widget in vertical direction
// Row = For creating widets in horizontal direction

// ListView 
// SingleChildScrollview


// for cliking stuff 

//  Buttons: 
//  - MaterialButton/ FlatButton/ TextButton 

// Inkwell , GestureDetector 


// Dialog

//  Text 


//  TextField 


// BottomSheet

// SizedBox