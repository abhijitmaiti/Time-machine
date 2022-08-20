import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Map data = {};

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    String backgroundImage;
    String fontColor;
    if (data['isMorningTime'] == true) {
      backgroundImage = 'morning.png';
    }
    if (data['isDayTime'] == true) {
      backgroundImage = 'day.jpeg';
      fontColor = 'black';
    } else if (data['isEveningTime'] == true) {
      backgroundImage = 'evening.jpeg';
    } else if (data['isNightTime'] == true) {
      backgroundImage = 'night.jpeg';
      fontColor = 'white';
    }
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Home",
      //     style: TextStyle(
      //         fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.amber,
      // ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$backgroundImage'),
                fit: BoxFit.cover)),
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
          child: Column(
            children: [
              Container(
                child: FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'flag': result['flag'],
                          'timezone': result['timezone'],
                          'isDayTime': result['isDayTime'],
                          'isEveningTime': result['isEveningTime'],
                          'isNightTime': result['isNightTime'],
                          'isMorningTime': result['isMorningTime'],
                        };
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.black,
                      size: 30,
                    ),
                    label:
                        Text("Edit Location", style: TextStyle(fontSize: 17))),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Text(data['location'],
                      style: TextStyle(
                          fontSize: 38,
                          fontFamily: 'Lobster',
                          fontWeight: FontWeight.bold))),
              SizedBox(
                height: 30,
              ),
              Container(
                  child: Text(data['time'],
                      style: TextStyle(fontSize: 74, fontFamily: 'Lobster'))),
            ],
          ),
        ),
      ),
    );
  }
}
