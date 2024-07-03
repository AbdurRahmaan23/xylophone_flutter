import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Future<void> playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.setAsset('assets/audio/note$soundNumber.wav');
    player.play();
  }
  Expanded buildKey({required Color color ,required int soundNumber}){
    return Expanded(
      child: TextButton(
        child: Text('Click Me'),
        onPressed: () {
          playSound(soundNumber);
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(color),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(color:Colors.red,soundNumber:1),
              buildKey(color:Colors.orange,soundNumber:2),
              buildKey(color:Colors.yellow,soundNumber:3),
              buildKey(color:Colors.green,soundNumber:4),
              buildKey(color:Colors.teal,soundNumber:5),
              buildKey(color:Colors.blue,soundNumber:6),
              buildKey(color:Colors.purple,soundNumber:7),
            ],
          ),
        ),
      ),
    );
  }
}
