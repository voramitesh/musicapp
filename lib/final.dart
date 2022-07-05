import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/main.dart';

class Final extends StatefulWidget {
  const Final({Key? key}) : super(key: key);

  @override
  _FinalState createState() => _FinalState();
}

class _FinalState extends State<Final> {
  int ima = 0;
  AudioCache audioCache = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();
  Duration? total_duration = Duration(seconds: 0);
  Duration? live_duration = Duration(seconds: 0);
  bool isPlay = false;
  @override
  void initState() {
    super.initState();
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        total_duration = event;
      });

      audioPlayer.onAudioPositionChanged.listen((event) {
        setState(() {
          live_duration = event;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Modaldata data = ModalRoute.of(context)!.settings.arguments as Modaldata;
    return SafeArea(

      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading : (
              IconButton(onPressed: (){
                Navigator.pop(context);

              }, icon: Icon(Icons.arrow_back))
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "${data.name2}",
          ),
        ),
        body:Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.network("${data.image1}",fit: BoxFit.cover,),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white54,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 150),
                      height: 200,
                      width: 200,
                      color: Colors.red,
                      child: Image.network("${data.image1}"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CREATE BY MR.KK",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                IconButton(
                  onPressed: ()async{
                    if (ima % 2 == 0) {
                      ima=1;
                      int res = await audioPlayer.play("${data.song4}");

                      setState(() {
                        isPlay = true;
                      });
                    } else {
                      ima=0;
                      audioPlayer.pause();
                      setState(() {
                        isPlay = false;
                      });
                    }
                  },
                  icon : Icon(
                    isPlay == true ? Icons.pause_outlined : Icons.play_arrow,
                    color: Colors.black,size: 40,
                  ),
                ),

                Slider(
                  min: 0,
                  max: total_duration!.inSeconds.toDouble(),
                  value: live_duration!.inSeconds.toDouble(),
                  onChanged: (value){
                    audioPlayer.seek(Duration(seconds: value.toInt()));
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${live_duration}",style: TextStyle(color: Colors.black),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${total_duration}",style: TextStyle(color: Colors.black),),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}