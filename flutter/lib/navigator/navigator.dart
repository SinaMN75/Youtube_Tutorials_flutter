import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("NavigatorPage")),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (BuildContext context) => Page1(), fullscreenDialog: true),
                );
              },
              child: Text("Navigator.push"),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("TITLE"),
                      content: Text("CONTENT"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Button 1")),
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text("Button 2")),
                      ],
                      backgroundColor: Colors.red,
                      icon: Icon(Icons.add),
                    );
                  },
                  barrierDismissible: false,
                );
              },
              child: Text("showDialog"),
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text("Text"),
                          subtitle: Text(index.toString()),
                        );
                      },
                    );
                  },
                );
              },
              child: Text("showModalBottomSheet"),
            ),
            Divider(height: 100),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  Page1(),
                  transition: Transition.rightToLeftWithFade,
                  duration: Duration(seconds: 1),

                );
              },
              child: Text("Get.to"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.dialog(
                  AlertDialog(
                    title: Text("TITLE"),
                    content: Text("CONTENT"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Button 1")),
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text("Button 2")),
                    ],
                    backgroundColor: Colors.red,
                    icon: Icon(Icons.add),
                  ),
                );
              },
              child: Text("Get.dialog"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text("Text"),
                        subtitle: Text(index.toString()),
                      );
                    },
                  ),
                  backgroundColor: Colors.white,
                  elevation: 100,
                  isDismissible: false,
                );
              },
              child: Text("showModalBottomSheet"),
            ),
          ],
        ),
      );
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Colors.red,
          child: Center(
            child: Column(
              children: [
                Text("PAGE 1", style: TextStyle(fontSize: 40)),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Navigator.pop"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Get.back"),
                ),
              ],
            ),
          ),
        ),
      );
}
