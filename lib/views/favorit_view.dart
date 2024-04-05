import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView ({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  List<QueryDocumentSnapshot> data =[];
  getdata()async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("users").get();
     data.addAll(querySnapshot.docs);
     setState(() {
       
     });
    }
  // getdata()async{
  //  await FirebaseFirestore.instance
  //   .collection('users')
  //   .get()
  //   .then((QuerySnapshot querySnapshot) {
  //       querySnapshot.docs.forEach((doc) {
  //           print(doc["title"]);
  //       });
  //   });
  //   setState(() {
      
  //   });
  
 void initState(){
  getdata();
  super.initState();
 }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading:const  Text(""),
        title: Text("b".tr,style:const TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurpleAccent,
         iconTheme:const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          
          childAspectRatio:2.5/4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
          itemCount: data.length,
           itemBuilder:(context,Index ){
            if(data.isNotEmpty){
            return  Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.black12),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
              child: Image.network(
                "${data[Index]["age"]}",
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.20,
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "${data[Index]["title"]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "${data[Index]["description"]}",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
           
            
          ],
        ),
            );}
            else{
              return Center(child: Text("kjkjkj"),);
            }
           },
        ),
      ));

     
       
      
    
  }
}