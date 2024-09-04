import 'package:flutter/material.dart';
import 'package:flutter_json_task/Constant/const.dart';
import 'package:flutter_json_task/Custom%20Widget/custom_text.dart';
import 'package:flutter_json_task/Custom%20Widget/custom_button.dart';
import 'package:flutter_json_task/Model/json_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<AndroidVersion> getData = [];

  void parseJson(dynamic input) {
    getData.clear();
    for (var item in input) {
      if (item is Map) {
        item.forEach((key, value) {
          if (value is Map &&
              value.containsKey('id') &&
              value.containsKey('title')) {
            getData.add(AndroidVersion(id: value['id'], title: value['title']));
          }
        });
      } else if (item is List) {
        for (var subItem in item) {
          if (subItem is Map &&
              subItem.containsKey('id') &&
              subItem.containsKey('title')) {
            getData.add(
                AndroidVersion(id: subItem['id'], title: subItem['title']));
          }
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Json Task',
          size: 18,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
        elevation: 5,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0XFF8E2DE2), Color(0XFF4A00E0)],
                  transform: GradientRotation(90)),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                          text: 'Output 1',
                          ontap: () {
                            parseJson(InputData().input1);
                          }),
                      CustomButton(
                          text: 'Output 2',
                          ontap: () {
                            parseJson(InputData().input2);
                          }),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
                height: 250,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0XFF8E2DE2), Color(0XFF4A00E0)],
                        transform: GradientRotation(90)),
                    borderRadius: BorderRadius.all(
                        Radius.circular(10),
                        )),
                child: GridView.builder(
                  itemCount: getData.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return Center(
                        child: CustomText(
                      text: getData[index].title.toString(),
                      color: const Color(0XFFFFFFFF),
                      size: 12,
                      fontWeight: FontWeight.w500,
                    ));
                  },
                )),
          ],
        ),
      ),
    );
  }
}
