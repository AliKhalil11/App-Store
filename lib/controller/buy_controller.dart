import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'home_page_controller.dart';

class Buy extends GetxController{
HomePageController controller = Get.find();
 CollectionReference categories = FirebaseFirestore.instance.collection('users');
   
Future<void> addUser() async {
  try {
    for (int i = 0; i < controller.cartproduct.length; i++) {
      // Call the user's CollectionReference to add a new user
      await categories.add({
        'title': controller.cartproduct[i].title,
        'description': controller.cartproduct[i].description,
        'age': controller.cartproduct[i].thumbnail,
      });
    }
    print("Users Added");
  } catch (error) {
    print("Failed to add users: $error");
  }
}


}