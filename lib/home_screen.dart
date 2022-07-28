import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flame/game.dart';
import 'package:flame_game/settings/game_state.dart';
import 'package:flame_game/widget.dart/menu_widget.dart';
import 'package:flame_game/widget.dart/over_widget.dart';
import 'package:flutter/material.dart';

import 'game/corsair_game.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Stream<QuerySnapshot> snapshot = FirebaseFirestore.instance
      .collection('users')
      .orderBy('score', descending: true).limit(10)
      .snapshots();
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    Timer.run(() => showAlert(context));

  }
  void setStates() {
    if (mounted) {
      setState(() {});
    }
  }
  //load

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
            child: GameState.type == GameType.empty
                ?
                //menu widget
                MenuWidget(setStates: setStates)
                : GameState.type == GameType.overGame
                    ? OverWidget(setStates: setStates)
                    : GameWidget(
                        game: CorsairGame(setStates: setStates),
                      )),
      ),
    );
  }
  void showAlert(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("User"),
          content: Stack(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(hintText: "Email", border: OutlineInputBorder()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a valid email address';
                          }
                          if (!value.contains('@')) {
                            return 'Email is invalid, must contain @';
                          }
                          if (!value.contains('.')) {
                            return 'Email is invalid, must contain .';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: nameController,
                        decoration:const InputDecoration(hintText: "Name", border: OutlineInputBorder()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a valid name address';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            GameState.email = emailController.text;
                            GameState.name = nameController.text;
                            users
                                .add({
                              // 'email': emailController.text, // John Doe
                              'name': nameController.text, // Stokes and Sons
                              'score': 0 // 42
                            })
                                .then((value) => GameState.userId = value.id)
                                .catchError((error) => print("Failed to add user: $error"));
                            _formKey.currentState!.save();
                            Navigator.pop(context);
                          }
                        },
                        child: Text("Add"),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

}
