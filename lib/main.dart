import 'package:flutter/material.dart';
import 'package:musicapp/final.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Myapp(),
        '/final': (context) => Final(),
      },
    ),
  );
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  List image = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmCD_yA5o-5z1jk7GQBe5_pRBemgdnw14qJA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTiIcZ3x3Tv6ndTZxJ4vCkdQjGpdQa5i4k8o3I6F5HRHMZuIIILi8Z0z0_ZMTIDPHoQA8&usqp=CAU",
    "https://i.scdn.co/image/ab67616d0000b273281650a8e8c5d04658d31ac1",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJgOoVeOuQSm48qODXZZVjSmcj0LuZbsPAHw&usqp=CAU",
    "https://2.bp.blogspot.com/-_Zlo2WgZruU/XDxRgze1rwI/AAAAAAAABAo/gIUq-cUk0H0VkKhgW2YI6bWPeAzvBKVbACLcBGAs/s1600/dil-me-ho-tum-guitar-chords.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1xtKQVrrLB6twWvUWnOAHLWBDcEAbAB41XQ&usqp=CAU"
  ];
  List name = [
    "Tera Ban Jaunga",
    "Yaara true friends",
    "Ghungroo",
    "pal pal dil ke pass title track",
    "dil mein ho tum",
    "dheere dheere"
  ];
  List singar = [
    "Tulsi kumar",
    "mamta sharma",
    "arijit singh",
    "arijit singh",
    "armaann malik",
    "yo yo honey singh"
  ];
  List song = [
    "https://pagalsong.in/uploads/systemuploads/mp3/Kabir%20Singh/Tera%20Ban%20Jaunga%20-%20Kabir%20Singh%20128%20Kbps.mp3",
    "https://pagalsong.in/uploads/systemuploads/mp3/Yaara/Yaara%20-%20Mamta%20Sharma%20128%20Kbps.mp3",
    "https://songs14.vlcmusic.com/mp3/org/22085.mp3",
    "https://pagalsong.in/uploads/systemuploads/mp3/Kabir%20Singh/Tera%20Ban%20Jaunga%20-%20Kabir%20Singh%20128%20Kbps.mp3",
    "https://pagalsong.in/uploads/systemuploads/mp3/Yaara/Yaara%20-%20Mamta%20Sharma%20128%20Kbps.mp3",
    "https://songs14.vlcmusic.com/mp3/org/22085.mp3",
  ];
  List l4 = [
    Colors.indigo,
    Colors.blueAccent,
    Colors.blue,
    Colors.green,
    Colors.greenAccent,
    Colors.lightGreenAccent,
  ];
  List<Modaldata> l5 = [];
  int i = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      for (i = 0; i < image.length; i++) {
        Modaldata modaldata = Modaldata(image[i], name[i], singar[i],song[i]);
        l5.add(modaldata);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber,
          title: Text("MUSIC Application",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
        ),
        body: ListView.builder(
          itemCount: image.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/final',
                    arguments: l5[index]);

              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: l4[index],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network("${image[index]}"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${name[index]}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${singar[index]}",
                              style:
                              TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Modaldata {
  String image1, name2, singar3,song4;

  Modaldata(this.image1, this.name2, this.singar3,this.song4);
}