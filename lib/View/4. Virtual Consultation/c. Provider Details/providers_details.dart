import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harees_new_project/Resources/AppColors/app_colors.dart';
import 'package:harees_new_project/View/4.%20Virtual%20Consultation/d.%20Payment/payment.dart';
import 'package:harees_new_project/View/8.%20Chats/Models/user_models.dart';

class Provider_Details extends StatelessWidget {
  final UserModel userModel;
  final User firebaseUser;
  final Map<String, dynamic> providerData;

  Provider_Details({
    required this.providerData,
    required this.userModel,
    required this.firebaseUser,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.keyboard_double_arrow_left_sharp, color: Colors.black, size: 40),
        ),
        title: Text(
          'Provider Details',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Step",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: MyColors.blue,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "3 of 4",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            Divider(
              color: MyColors.logocolor,
              thickness: 2.0,
              height: 10.0,
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "Selected Provider:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Name: ${providerData['name'] ?? 'N/A'}',
                style: TextStyle(fontSize: 18),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Experience: ${providerData['experience'] ?? 'N/A'}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Email: ${providerData['email'] ?? 'N/A'}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              leading: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(providerData['image'] ?? 'https://via.placeholder.com/150'),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: MyColors.logocolor, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => PaymentDetailsPage(
                                userModel: userModel,
                                firebaseUser: firebaseUser,
                                packageName: "none",
                                packagePrice: "400 ",
                                providerData: providerData,
                              ));
                            },
                            child: Text(
                              "05:15 pm",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: MyColors.logocolor, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => PaymentDetailsPage(
                                userModel: userModel,
                                firebaseUser: firebaseUser,
                                packageName: "none",
                                packagePrice: "400 ",
                                providerData: providerData,
                              ));
                            },
                            child: Text(
                              "06:30 pm",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: MyColors.logocolor, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => PaymentDetailsPage(
                                userModel: userModel,
                                firebaseUser: firebaseUser,
                                packageName: "none",
                                packagePrice: "400 ",
                                providerData: providerData,
                              ));
                            },
                            child: Text(
                              "07:00 pm",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Divider(
              color: Colors.black,
              thickness: 2.0,
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Get.to(() => PaymentDetailsPage(
                  userModel: userModel,
                  firebaseUser: firebaseUser,
                  providerData: providerData,
                  packageName: '',
                  packagePrice: '',
                ));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFc1e9e4),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Proceed to Payment Details",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.keyboard_double_arrow_right, color: Colors.black, size: 30),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
