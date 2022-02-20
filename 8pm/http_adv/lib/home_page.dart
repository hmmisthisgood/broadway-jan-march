import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as apiClient;
import 'package:http_adv/util/constants.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logger = Logger();

  /// for 1 request
  String dataFromServer = "";
  String errorMessage = "";

  bool isLoading = false;
  bool hasErrorOccurred = false;
  bool isDataFetchSuccess = false;


bool isPostsLoading= false; 
bool isStoriesLoaind=false; 





  @override
  void initState() {
    super.initState();
  }

  fetchStories() {}
  fetchSponsored() {}

  fetchPosts() async {
    logger.i("Fethinvg data from server");

    // for just one request
    final url =
        "https://pixabay.com/api/?key=${Constants.API_KEY}&q=cats&image_type=photo";

    logger.i(url);

    final uri = Uri.parse(url);

    try {
      isLoading = true;
      setState(() {});

      final response = await apiClient.get(uri);

      ///dynamic/map

      final body = response.body;
      // final statusCode = response.statusCode;

      final decodedJson = json.decode(body);
      dataFromServer = body;
      // List<Map> = List<Photo>

      // print(body);
      // logger.d(decodedJson);

      // logger.d(statusCode); // ~200

      isLoading = false;

      isDataFetchSuccess = true;

      setState(() {});
    } catch (e) {
      hasErrorOccurred = true;
      isLoading = false;
      isDataFetchSuccess = false;

      errorMessage = e.toString();
      setState(() {});
      logger.e(e);
    }
  }



  Widget buildBody() {
// 1. Loading indicator
// 2. error message
// 3. success data / ui

    if (isLoading) return CircularProgressIndicator();

    if (hasErrorOccurred == true)
      return Text(
        errorMessage,
        style: TextStyle(color: Colors.red),
      );

    if (isDataFetchSuccess == true)
      return Text(
        dataFromServer,
        style: TextStyle(color: Colors.green),
      );

    return MaterialButton(
      color: Colors.greenAccent,
      onPressed: () => fetchPosts(),
      child: Text("Fetch data from server"),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("build called");
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// bad way of building ui. TODO: dont do this
        // isLoading == true
        //     ? CircularProgressIndicator()
        //     : hasErrorOccurred == true
        //         ? Text(
        //             errorMessage,
        //             style: TextStyle(color: Colors.red),
        //           )
        //         : isDataFetchSuccess == true
        //             ? Text(
        //                 dataFromServer,
        //                 style: TextStyle(color: Colors.green),
        //               )
        //             : MaterialButton(
        //                 color: Colors.greenAccent,
        //                 onPressed: () => fetchPosts(),
        //                 child: Text("Fetch data from server"),
        //               )

        buildBody()
      ],
    ));
  }
}
