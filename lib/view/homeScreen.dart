import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:circular_countdown_timer/countdown_text_format.dart';
import 'package:final_exam/controller/homeController.dart';
import 'package:final_exam/database/db.dart';
import 'package:final_exam/view/addProduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());
  DbHelper db = DbHelper();
  final CountDownController _controller = CountDownController();

  int i = 1;

  void getData() async {
    homeController.ProductDetails.value = await db.readData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Welcome!"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(AddProduct());
                },
                icon: Icon(Icons.add)),
            IconButton(
                onPressed: () {
                  // db.updateData("1",1);
                  // db.updateData("2",1);
                  // db.updateData("3",1);
                  // db.updateData("4",1);
                  // db.updateData("5",1);
                  homeController.status.value = true;



                },
                icon: Icon(Icons.restart_alt))
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: (){
                    _controller.start();
                  },
                  child: CircularCountDownTimer(
                    duration: 30,
                    initialDuration: 0,
                    controller: _controller,
                    width: 50,
                    height: 50,
                    ringColor: Colors.grey[300]!,
                    ringGradient: null,
                    fillColor: Colors.purpleAccent[100]!,
                    fillGradient: null,
                    backgroundColor: Colors.purple[500],
                    backgroundGradient: null,
                    strokeWidth: 20.0,
                    strokeCap: StrokeCap.round,
                    textStyle: TextStyle(
                        fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold),
                    textFormat: CountdownTextFormat.S,
                    isReverse: false,
                    isReverseAnimation: false,
                    isTimerTextShown: true,
                    autoStart: false,
                    onStart: () {
                      debugPrint('Countdown Started');
                    },
                    onComplete: () {
                      // db.updateData("1",0);
                      // db.updateData("2",0);
                      // db.updateData("3",0);
                      // db.updateData("4",0);
                      // db.updateData("5",0);
                      homeController.status.value = false;
                    },
                    onChange: (String timeStamp) {
                      debugPrint('Countdown Changed $timeStamp');
                    },
                    timeFormatterFunction: (defaultFormatterFunction, duration) {
                      if (duration.inSeconds == 0) {
                        return "Start";
                      } else {
                        return Function.apply(defaultFormatterFunction, [duration]);
                      }
                    },
                  ),
                ),
              ),
            ),
            Obx(
              () => Expanded(
                child: ListView.builder(
                  itemCount: homeController.ProductDetails.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 130,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "${homeController.ProductDetails[index]['product_name']}"),
                                Obx(
                                  () => Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            homeController.i++;
                                          },
                                          icon: Icon(Icons.add)),
                                      Text("${homeController.i}"),
                                      IconButton(
                                          onPressed: () {
                                            homeController.i--;
                                          },
                                          icon: Icon(Icons.remove)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Obx(
                              ()=> Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "₹ ${homeController.ProductDetails[index]['product_price']}"),
                                  homeController.status.isFalse?ElevatedButton(onPressed: (){}, child: Text("out of stock"),style: ElevatedButton.styleFrom(backgroundColor: Colors.red),):ElevatedButton(
                                      onPressed: () {

                                      },
                                      child: Text("Add to cart"))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
