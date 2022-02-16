import 'package:flutter/material.dart';
import 'package:newproj/widgets/my_post_gridview_widget.dart';

class ProfieScreen extends StatefulWidget {
  ProfieScreen({Key? key}) : super(key: key);

  @override
  State<ProfieScreen> createState() => _ProfieScreenState();
}

class _ProfieScreenState extends State<ProfieScreen>
    with SingleTickerProviderStateMixin {
  final postImage =
      "https://cdn.pixabay.com/photo/2021/11/06/16/11/greece-6773683_960_720.jpg";

  final Color customGreen = Color(0xff88A858);
  var color = Colors.green;

  late TabController tabController;

  bool switchValue = false;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  Widget buildSecondTab() {
    return Container(
      child: PageView(
        scrollDirection: Axis.vertical,
        children: [
          Container(color: Colors.yellow),
          Container(color: Colors.pink),
          Container(color: Colors.black),
          Container(color: Colors.white),
          Container(color: Colors.yellow),
          Container(color: Colors.green),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: customGreen,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            "My username",
            style: TextStyle(color: customGreen),
          ),
        ),
        body: Column(
          children: [
            Switch(
              value: switchValue,
              activeColor: customGreen,
              onChanged: (val) {
                switchValue = val;
                setState(() {});
              },
            ),
            TextButton(onPressed: () {}, child: Text("This is text")),
            Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: MaterialButton(
                    color: customGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {},
                    child: Text("Following",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: MaterialButton(
                    // color: Colors.green,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.black,
                          width: 0.8,
                        )),
                    child: Text("Message",
                        style: TextStyle(color: Colors.black54)),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            Divider(
              color: customGreen,
              thickness: 1.3,
            ),
            Container(
              // color: Colors.green,
              height: 80,
              child: TabBar(
                indicatorColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 5,
                indicatorPadding: EdgeInsets.symmetric(vertical: 4),
                controller: tabController,
                isScrollable: true,
                labelColor: customGreen,
                unselectedLabelColor: Colors.grey.withOpacity(0.5),
                tabs: [
                  Icon(
                    Icons.grid_4x4,
                    size: 40,
                  ),
                  Icon(
                    Icons.person,
                    size: 40,
                  ),

                  // Text("Children"),
                ],
              ),
            ),
            Flexible(
              child: TabBarView(
                controller: tabController,
                children: [MyPostsGridViewWidget(), buildSecondTab()],
              ),
            ),
          ],
        ));
  }
}
