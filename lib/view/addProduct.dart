import 'package:final_exam/database/db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/homeController.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  DbHelper db = DbHelper();

  HomeController homeController = Get.put(HomeController());

  void getData() async {
    homeController.ProductDetails.value = await db.readData();
  }

  TextEditingController txtpname = TextEditingController();
  TextEditingController txtpqunt = TextEditingController();
  TextEditingController txtpprice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Product"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                controller: txtpname,
                style: TextStyle(fontSize: 18),
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Product Name",
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(color: Colors.blue.shade900, width: 3),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: txtpqunt,
                style: TextStyle(fontSize: 18),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Quantity",
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(color: Colors.blue.shade900, width: 3),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: txtpprice,
                style: TextStyle(fontSize: 18),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Price",
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(color: Colors.blue.shade900, width: 3),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  db.insertData(txtpname.text, txtpqunt.text, txtpprice.text, 1);
                  getData();
                  Get.back();
                },
                child: Text("Add Item"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
