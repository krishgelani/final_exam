import 'package:final_exam/model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{
  RxList ProductDetails = [].obs;
  RxList<Model> CartDetails = <Model>[].obs;
  RxBool status = true.obs;
  RxInt i = 1.obs;
  RxInt timer = 30.obs;
}