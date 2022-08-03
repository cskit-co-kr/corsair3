import 'package:flame_game/settings/game_state.dart';
import 'package:flame_game/widget.dart/score_widget.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  Function setStates;
  MenuWidget({Key? key, required this.setStates}) : super(key: key);
  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  TextEditingController nameController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 12),
              ScoreWidget(isResult: false),
              SizedBox(height: MediaQuery.of(context).size.height / 24),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF5F5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter name',
                  ),
                  maxLines: 1,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 24),
            ],
          ),
          InkWell(
            onTap: () async {
              if (nameController.text.isNotEmpty) {
                GameState.name = nameController.text;
                GameState.type = GameType.loadingGame;
                GameState.score = 0;
                GameState.level = 1;
                widget.setStates();
              } else {
                await showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          content: SizedBox(
                              height: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Name is reuired\nPlease enter name',
                                    textAlign: TextAlign.center,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context, true);
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                      ),
                                      child: const Center(
                                          child: Text(
                                        'OK',
                                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                                      )),
                                    ),
                                  )
                                ],
                              )),
                        ));
              }
            },
            child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF5F5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Play',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF722F2F)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
