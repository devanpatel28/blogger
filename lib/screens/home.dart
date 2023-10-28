import 'package:blogger/helpers/size.dart';
import 'package:blogger/screens/new_blog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text("Blogger",style: TextStyle(fontFamily: "MainBold",fontSize: getFontSize(context, 3),color: Colors.deepOrange[500])),
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
          child: Center(
            child: Column(
              children: [
                SizedBox(height: getHeight(context, 0.03)),
                Container(
                  height: getHeight(context, 0.9),
                  width: getWidth(context, 0.9),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20)
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
