import 'package:blogger/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../db_operation.dart';
import '../helpers/size.dart';
class NewBlog extends StatefulWidget {
  const NewBlog({super.key});

  @override
  State<NewBlog> createState() => _NewBlogState();
}

class _NewBlogState extends State<NewBlog> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  TextEditingController blgTitle = TextEditingController();
  TextEditingController blgBody = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text("New Blog",style: TextStyle(fontFamily: "MainBold",fontSize: getFontSize(context, 3),color: Colors.deepOrange[500])),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Center(
                  child: TextField(textAlignVertical: TextAlignVertical.center,
                    maxLength: 200,
                    style: TextStyle(fontFamily: "MainBold",fontSize: getFontSize(context, 3)),
                    controller: blgTitle,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                        hintText: "Title",
                        hintStyle: TextStyle(fontFamily: "Main",fontSize: getFontSize(context, 3)),
                        filled: true,
                        fillColor: Colors.grey[200],
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepOrangeAccent,width: 1.5)
                            ,borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12,width: 0.5)
                            ,borderRadius: BorderRadius.circular(10)),
                      counterText: "",
                    )),
                ),
              ),
              SizedBox(height: getHeight(context, 0.03),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.multiline,
                    minLines: getFontSize(context, 3.2).toInt(),
                    maxLines: null,
                    style: TextStyle(fontFamily: "Main",fontSize: getFontSize(context, 2.3)),
                    controller: blgBody,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10,top: 15),
                      hintText: "Body",
                      hintStyle: TextStyle(fontFamily: "Main",fontSize: getFontSize(context, 2.3)),
                      filled: true,
                      fillColor: Colors.grey[200],
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrangeAccent,width: 1.5)
                          ,borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12,width: 0.5)
                          ,borderRadius: BorderRadius.circular(10)),
                      counterText: "",
                    )),
              ),
              SizedBox(height: getHeight(context, 0.02),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    if(blgTitle.text.isNotEmpty && blgBody.text.isNotEmpty) {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) =>
                              AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                title: Center(child: Text('Leave')),
                                content: Text(
                                    "Are you want to leave without save?"),
                                actions: <Widget>[
                                  Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceAround,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () => Get.back(),
                                          child: Text('NO'),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.orange,
                                              fixedSize: Size(
                                                  getWidth(context, 0.2),
                                                  getHeight(context, 0.05)),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(15)),
                                              elevation: 1
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.off(HomeScreen(),
                                                curve: Curves.fastLinearToSlowEaseIn,
                                                duration: Duration(seconds: 1));
                                          },
                                          child: Text('YES'),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.orange,
                                              fixedSize: Size(
                                                  getWidth(context, 0.2),
                                                  getHeight(context, 0.05)),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(15)),
                                              elevation: 1
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                    }
                    else{
                      Get.back();
                    }
                      },
                    child: Text("Leave",style: TextStyle(color:Colors.orange,fontFamily: "MainBold",fontSize: getFontSize(context, 2.5)),),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: Size(getWidth(context, 0.4), getHeight(context, 0.06)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: Colors.orange,width: 2),
                        ),
                        elevation: 1
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    FirebaseOperations.addTransction(blgTitle.text, blgBody.text, DateFormat.yMMMd().format(DateTime.now()));
                    blgTitle.clear();
                    blgBody.clear();
                    print("UPLOADED");
                  }, child: Text("SAVE",style: TextStyle(fontFamily: "MainBold",fontSize: getFontSize(context, 2.5)),),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        fixedSize: Size(getWidth(context, 0.4), getHeight(context, 0.06)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        elevation: 1
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
