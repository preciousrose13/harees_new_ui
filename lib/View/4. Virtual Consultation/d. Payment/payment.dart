// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harees_new_project/Resources/AppColors/app_colors.dart';
import 'package:harees_new_project/View/4.%20Virtual%20Consultation/b.%20E-Clinics/e_clinic.dart';
import 'package:harees_new_project/View/8.%20Chats/Models/user_models.dart';

class PaymentDetailsPage extends StatelessWidget {
  final UserModel userModel;
  final User firebaseUser;
  final String packageName;
  final String packagePrice;

  const PaymentDetailsPage({super.key, 
    required this.packageName,
    required this.packagePrice,
    required Map<String, dynamic> providerData, required this.userModel, required this.firebaseUser,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment Details',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                        "4 of 4",
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

                  // Text(packageName,
                  //     style:
                  //         TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  // SizedBox(height: 10),
                  // Text('Price: $packagePrice', style: TextStyle(fontSize: 16)),

                  ListTile(
                    title: Text('Harees Health:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: MyColors.logocolor,
                        )),
                    subtitle: Text(
                      'Laboratory Riyadh, Saudi Arabia',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    leading: Image.asset("assets/logo/harees_logo.png"),
                  ),

                  SizedBox(height: 10),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Laboratory',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: MyColors.logocolor,
                            )),
                        Row(children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.grey.shade800,
                            size: 20,
                          ),
                          SizedBox(width: 5),
                          Text('Jan 20, 2024 - 7:00 PM',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ))
                        ])
                      ]),

                  SizedBox(height: 5),

                  Text('Zyad Faisal',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),

                  SizedBox(height: 5),

                  Row(children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: MyColors.blue,
                      size: 28,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Riyadh, Saudi Arabia',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ]),

                  SizedBox(height: 5),

                  Container(
                      width: 500,
                      color: Color(0xFFc1e9e4),
                      child: Column(children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(".",
                            style: TextStyle(
                              color: Color(0xFFc1e9e4),
                            ))
                      ])),

                  SizedBox(height: 5),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(
                            Icons.percent_sharp,
                            color: MyColors.blue,
                            size: 28,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Add promo code here',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ]),
                        Text('Apply',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: MyColors.logocolor,
                            )),
                      ]),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text('SAR 0',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: MyColors.logocolor,
                              )),
                          SizedBox(width: 10),
                          Text(
                            'Use wallet balance',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ]),
                        Icon(Icons.toggle_off_outlined,
                            color: Colors.grey.shade800, size: 28),
                      ]),

                  SizedBox(height: 10),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => E_Clinics(
                              userModel: userModel,
                              firebaseUser: firebaseUser, 
                              targetUser: userModel,
                              
                              ));
                          },
                          child: Text('Pay With Bank Points',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() =>  E_Clinics(
                              userModel: userModel,
                              firebaseUser: firebaseUser,
                              targetUser: userModel,
                              ));
                          },
                          child: Icon(Icons.keyboard_arrow_right,
                              color: Colors.grey.shade800, size: 28),
                        ),
                      ]),

                  SizedBox(height: 10),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() =>  E_Clinics(
                              userModel: userModel,
                              firebaseUser: firebaseUser,
                              targetUser: userModel,
                              ));
                          },
                          child: Text('Pay With Bank Points',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() =>  E_Clinics(
                              userModel: userModel,
                              firebaseUser: firebaseUser,
                              targetUser: userModel,
                              ));
                          },
                          child: Icon(Icons.keyboard_arrow_right,
                              color: Colors.grey.shade800, size: 28),
                        ),
                      ]),

                  SizedBox(height: 10),

                  Container(
                    width: 500,
                    color: Color(0xFFc1e9e4),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Select payment method',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                )),
                            Row(children: [
                              Icon(Icons.text_snippet_outlined,
                                  color: Colors.red.shade800, size: 28),
                              Text(
                                'Cancellation policy',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                          ]),
                    ),
                  ),

                  SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 30),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Apple Pay',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.apple,
                                color: Colors.black,
                              )
                            ]),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Split into 3 payments',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              Image.asset("assets/images/payment1.png",
                                  height: 30),
                            ]),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '4 interests-free payments',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              Image.asset("assets/images/payment2.png",
                                  height: 30),
                            ]),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Card payments',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.payment,
                                color: Colors.black,
                              )
                            ]),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),

                  Text('Price Breakup',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: MyColors.logocolor,
                      )),

                  SizedBox(height: 10),

                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: MyColors.PageBg),
                    width: 500,
                    child: Column(children: [
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Selected test',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Vitamin D',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'SAR 100',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ]),
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Home Visit Fee',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'SAR 100',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ]),
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'VAT (+)',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'SAR 0',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ]),
                      SizedBox(height: 10),
                    ]),
                  ),

                  SizedBox(height: 10),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount Payable',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'SAR 200',
                          style: TextStyle(
                              fontSize: 18,
                              color: MyColors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                ])),
      )),
    );
  }
}
