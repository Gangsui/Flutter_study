import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget  {

  void musicSound(int music) async {
    final player = AudioPlayer();
    await player.setSource(AssetSource('note$music.wav'));
    await player.resume();
  }

  Expanded song_cover(Color color, int music){
    return Expanded(
      child: GestureDetector(
        child: Container(color: color,),
        onTap:  ()  {
          musicSound(music);
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            song_cover(Colors.red,1),
            song_cover(Colors.orange,2),
            song_cover(Colors.yellow,3),
            song_cover(Colors.green,4),
            song_cover(Colors.lime,5),
            song_cover(Colors.blue,6),
            song_cover(Colors.purple,7),

        ],
        ),
      ),
    );
  }
}