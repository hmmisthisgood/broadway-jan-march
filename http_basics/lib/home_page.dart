import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_basics/widgets/common_post_widget.dart';

import 'model/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
//
  List dataFromServer = [];
  bool isFetchingData = false;
  String errorMessage = "";
  final userImage =
      "https://www.bkacontent.com/wp-content/uploads/2020/10/Depositphotos_336730000_l-2015.jpg";
  final postImage =
      "https://cdn.pixabay.com/photo/2021/11/06/16/11/greece-6773683_960_720.jpg";
  @override
  void initState() {
    super.initState();

    print("1. Initstate called");
    getDataFromServerAsyncAwati();
    // getSomeDataFromServer();
  }

  getSomeDataFromServer() {
    print("GET data from server");

    final dio = Dio();

    final url = "https://jsonplaceholder.typicode.com/posts";

    print("Finally fetching data from server");

    // Completer completer = Completer();
    // completer.complete();
    // completer.completeError(error);

    // final response =
    final response = dio.get(url).then((value) {
      print("Response status code: ${value.statusCode} \n\n");

      // print(value.data);
    }).catchError((e) {
      print(e);
    });

    dio.get(url).then((value) {
      print("Response status code: ${value.statusCode} \n\n");

      // print(value.data);
    }).catchError((e) {
      print(e);
    });

    // response.then((value) => null);
    // response.catchError((e) {});

    print("The request to server might be complated already");
  }

  getDataFromServerAsyncAwati() async {
    print("GET data from server await code");

    final url = "https://jsonplaceholder.typicode.com/posts";

    print("Finally fetching data from server await code");

    isFetchingData = true;
    setState(() {});
    Map postMap = {};

    // json.decode("");

    try {
      final response = await Dio().get(url);

      print("The request to server might be complated already");

      print("Response status code: ${response.statusCode} \n\n");

      // json.decode('actual data from the server in stringified form ');

      final temporaryData = Post.fromList(response.data);
      dataFromServer = temporaryData;

      isFetchingData = false;
      // print(dataFromServer);
      setState(() {});
    } on DioError catch (e) {
      print(e);
      isFetchingData = false;

      errorMessage = "An error occured while fetching data from the server";
      setState(() {});
    } catch (e, s) {
      print(e);
      print(s);
      isFetchingData = false;

      errorMessage = "Some error occurred";
      setState(() {});
    }
  }

//

//
  @override
  void dispose() {
    super.dispose();
    print("3. dispose() called");
  }

  Widget buildBody() {
    if (isFetchingData == true) {
      return const CircularProgressIndicator(strokeWidth: 1);
    }

    if (errorMessage.isEmpty) {
      return ListView.builder(
        itemCount: dataFromServer.length,
        itemBuilder: (context, index) {
          Post postData = dataFromServer[index];

          return CommonPostWidget(post: postData);
        },
      );
    }

    return Text(errorMessage);
  }

  @override
  Widget build(BuildContext context) {
    print("2. build() called");

    return Scaffold(
      body: Center(child: buildBody()),
    );
  }
}
