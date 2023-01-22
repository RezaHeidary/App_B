
import 'package:appc/controller/time_and_value_controller.dart';
import 'package:appc/model/value_and_time_model.dart';
import 'package:appc/view/add_page.dart';
import 'package:appc/view/edit_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
    HomeScreen({super.key});
   DataAndTimeController dataAndTimeController=Get.put(DataAndTimeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "Reminder",
            style: TextStyle(fontSize: 40),
          )),
        ),
        body: Scaffold(
            body: Center(
                child:TimeModel.listTime.isEmpty?const Text("Please  Add  Time",style: TextStyle(fontSize: 50),) : ListView.builder(
                      itemCount: TimeModel.listTime.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(20),
                        child: Material(
                          elevation: 15,
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.grey[200]),
                            child: SizedBox(
                              width: Get.width / 1.2,
                              height: Get.height / 8,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    nameAndPhoneText(index),
                                    updateAndDelet(index),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                ),
            ),
           
            floatingActionButton: SizedBox(
              width: 150,
              child: FittedBox(
                child: FloatingActionButton(
                  onPressed: () {
                    Get.to(AddScreen());
                  },
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              ),
            ));
  }

  //Void Update And Delete
  updateAndDelet(index) {
    return GestureDetector(
      onTap: () {
        Get.to(EditScreen(index:index));
      },
      child: const Padding(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: Icon(
          Icons.edit,
          size: 70,
        ),
      ),
    );
  }

  //Void Name and phone Text
  nameAndPhoneText(index) {
    // ignore: prefer_const_constructors
    return Padding(
      padding: const EdgeInsets.only(left: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(Icons.timer_sharp,size: 50),
          Text(
           "${TimeModel.listTime[index].hour}:${TimeModel.listTime[index].minute}",
           style: const TextStyle(fontSize: 40),
                ),
        ],
      ),
      
    );
  }
}
