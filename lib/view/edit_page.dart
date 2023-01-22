import 'package:appc/model/value_and_time_model.dart';
import 'package:appc/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import '../controller/time_and_value_controller.dart';

// ignore: must_be_immutable
class EditScreen extends StatelessWidget {
  EditScreen({super.key, this.index});
  var index;
  // ignore: prefer_typing_uninitialized_variables
  DataAndTimeController dataAndTimeController =
      Get.put(DataAndTimeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(
                child: Text(
          "Update",
          style: TextStyle(fontSize: 40),
        ))),
        body: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            rowforHourMinuteSeconds(),
            SizedBox(
              height: Get.height / 7,
            ),
            setTime()
          ],
        ),
        bottomNavigationBar:myBottomNavigationBar() );
  }

  //Void Row for Text  Hour Minute Seconds
  rowforHourMinuteSeconds() {
    return SizedBox(
      width: Get.width / 1.2,
      height: Get.height / 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Text(
            "Hour",
            style: TextStyle(fontSize: 45),
          ),
          const Text(
            "Minute",
            style: TextStyle(fontSize: 45),
          ),
          const Text(
            "Seconds",
            style: TextStyle(fontSize: 45),
          ),
        ],
      ),
    );
  }

  //Void set Time
  setTime() {
    return SizedBox(
      width: Get.width,
      height: Get.height / 4,
      child: FittedBox(
        child: TimePickerSpinner(
          isShowSeconds: true,
          is24HourMode: true,
          // ignore: prefer_const_constructors
          normalTextStyle: TextStyle(fontSize: 24, color: Colors.black),
          // ignore: prefer_const_constructors
          highlightedTextStyle: TextStyle(fontSize: 24, color: Colors.blue),
          spacing: 130,
          itemHeight: 80,
          isForce2Digits: true,
          time: dataAndTimeController.time.value,
          onTimeChange: (time) {
            dataAndTimeController.time.value = time;
          },
        ),
      ),
    );
  }

 //Void  bottomNavigationBar
  myBottomNavigationBar(){
    return Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 50,
                child: FittedBox(
                  child: FloatingActionButton(
                    backgroundColor: Colors.red,
                    onPressed: () {
                      dataAndTimeController.getDelete(index);
                      Get.offAll(HomeScreen());
                    },
                    child: const Icon(
                      Icons.delete,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 50,
                child: FittedBox(
                  child: FloatingActionButton(
                    onPressed: () {
                      dataAndTimeController.getUpdate(index);
                      dataAndTimeController.getNotifications();
                      Get.offAll(HomeScreen());
                    },
                    child: const Icon(
                      Icons.edit,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
  }

}
