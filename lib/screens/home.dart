import 'package:blogger/helpers/size.dart';
import 'package:blogger/screens/new_blog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../db_operation.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream<QuerySnapshot> collection = FirebaseOperations.fetchTransactions();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text("Blogger",style: TextStyle(fontFamily: "MainBold",fontSize: getFontSize(context, 3.5),color: Colors.deepOrange[500])),
      ),
      floatingActionButton: Container(
        height: getHeight(context, 0.07),
        width: getWidth(context, 0.35),
        child: FloatingActionButton(
          onPressed: (){
            Get.to(NewBlog(),curve: Curves.fastLinearToSlowEaseIn,duration: Duration(seconds: 1));
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          isExtended: true,
          backgroundColor: Colors.orange,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Icon(Icons.add),Text("New Blog",style: TextStyle(fontFamily: "MainBold",fontSize: getFontSize(context, 2)))]),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: getWidth(context, 0.95),
                  height: getHeight(context, 0.855),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: StreamBuilder(
                    stream: collection,
                    builder: (context, Snapshot) {
                      if (Snapshot.hasData) {
                        return ListView(
                          children: Snapshot.data!.docs.map((e) =>
                              Column(
                                children: [
                                  Container(
                                    height: getHeight(context, 0.5),
                                    width: getWidth(context, 0.9),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                  child: Text(e['title'],style: TextStyle(fontFamily: "MainBold",fontSize: getFontSize(context, 2.8)))),
                                              SizedBox(height: getHeight(context, 0.002)),
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text("Uploaded on "+e['date'],style: TextStyle(fontFamily: "Main",fontSize: getFontSize(context, 1.2)))),
                                            ],
                                          ),
                                          Divider(thickness: 1,height: 30),
                                          Expanded(
                                            child: SingleChildScrollView(
                                              child: Align(alignment: Alignment.topLeft,
                                                  child: Text(e['body'],style: TextStyle(fontFamily: "Main",fontSize: getFontSize(context, 2)))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: getHeight(context, 0.04),child: Divider(indent: 15,endIndent: 15,thickness: 1,),)
                                ],
                              )).toList(),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
