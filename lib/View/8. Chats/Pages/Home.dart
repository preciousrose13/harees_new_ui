// ignore_for_file: unused_import, library_private_types_in_public_api, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harees_new_project/Resources/Drawer/drawer.dart';
import 'package:harees_new_project/Resources/Search_bar/search_bar.dart';
import 'package:harees_new_project/View/8.%20Chats/Models/chat_room_model.dart';
import 'package:harees_new_project/View/8.%20Chats/Models/firebase_helper.dart';
import 'package:harees_new_project/View/8.%20Chats/Models/user_models.dart';
import 'package:harees_new_project/View/8.%20Chats/Pages/Chat_Room.dart';
import 'package:harees_new_project/View/8.%20Chats/Pages/Search_Page.dart';
import 'package:harees_new_project/Resources/AppColors/app_colors.dart';
import 'package:harees_new_project/View/9.%20Settings/settings.dart';

class Home extends StatefulWidget {
  final UserModel userModel;
  final User firebaseUser;
  final UserModel targetUser;

  const Home({
    Key? key,
    required this.userModel,
    required this.firebaseUser,
    required this.targetUser,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[50],
        elevation: 1,
        title: const Text("Messages"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey[300],
              backgroundImage: NetworkImage(
                widget.targetUser.profilePic.toString(),
              ),
            ),
          ),
        ],
      ),
      drawer: MyDrawer(
        userModel: widget.userModel,
        firebaseUser: widget.firebaseUser,
        targetUser: widget.userModel,
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/back_image.png",
              fit: BoxFit.cover,
            ),
          ),
          // Main Content
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const MySearchBar(),
                const SizedBox(height: 15),
                Expanded(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Chat Rooms")
                        .where("participants.${widget.userModel.uid}", isEqualTo: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.hasData) {
                          QuerySnapshot chatRoomSnapshot =
                              snapshot.data as QuerySnapshot;

                          return ListView.builder(
                            itemCount: chatRoomSnapshot.docs.length,
                            itemBuilder: (context, index) {
                              ChatRoomModel chatRoomModel = ChatRoomModel.fromMap(
                                  chatRoomSnapshot.docs[index].data()
                                      as Map<String, dynamic>);

                              Map<String, dynamic> participants =
                                  chatRoomModel.participants!;

                              List<String> participantKeys = participants.keys.toList();
                              participantKeys.remove(widget.userModel.uid);

                              return FutureBuilder(
                                future: FirebaseHelper.getUserModelById(participantKeys[0]),
                                builder: (context, userData) {
                                  if (userData.connectionState == ConnectionState.done) {
                                    if (userData.data != null) {
                                      UserModel targetUser = userData.data as UserModel;

                                      return Card(
                                        elevation: 5,
                                        child: ListTile(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) {
                                                return ChatRoomPage(
                                                  chatroom: chatRoomModel,
                                                  firebaseUser: widget.firebaseUser,
                                                  userModel: widget.userModel,
                                                  targetUser: targetUser,
                                                );
                                              }),
                                            );
                                          },
                                          leading: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                targetUser.profilePic.toString()),
                                          ),
                                          title: Text(targetUser.fullname.toString()),
                                          subtitle: (chatRoomModel.lastMessage
                                                      .toString() !=
                                                  "")
                                              ? Text(chatRoomModel.lastMessage.toString())
                                              : Text(
                                                  "Say hi to your new friend!",
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                  ),
                                                ),
                                        ),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  } else {
                                    return Container();
                                  }
                                },
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else {
                          return const Center(
                            child: Text("No Chats"),
                          );
                        }
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: MyColors.blue,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SearchPage(
              userModel: widget.userModel, 
              firebaseUser: widget.firebaseUser
            );
          }));
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
