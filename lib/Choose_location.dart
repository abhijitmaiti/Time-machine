import 'package:flutter/material.dart';
import 'package:time_machine/world_time_api.dart';

class Chooselocation extends StatefulWidget {
  @override
  _ChooselocationState createState() => _ChooselocationState();
}

class _ChooselocationState extends State<Chooselocation> {
  List<worldtimeapi> locations = [
    worldtimeapi(
      location: 'London',
      flag: 'london.png',
      url: 'Europe/London',
    ),
    worldtimeapi(
      location: 'Berlin',
      flag: 'berlin.png',
      url: 'Europe/Berlin',
    ),
    worldtimeapi(
      location: 'Cairo',
      flag: 'cairo.png',
      url: 'Africa/Cairo',
    ),
    worldtimeapi(
      location: 'Nairobi',
      flag: 'nairobi.png',
      url: 'Africa/Nairobi',
    ),
    worldtimeapi(
      location: 'Chicago',
      flag: 'chicago.png',
      url: 'America/Chicago',
    ),
    worldtimeapi(
      location: 'New York',
      flag: 'newyork.png',
      url: 'America/New_York',
    ),
    worldtimeapi(
      location: 'Seoul',
      flag: 'seoul.png',
      url: 'Asia/Seoul',
    ),
    worldtimeapi(
      location: 'Jakarta',
      flag: 'jakarta.png',
      url: 'Asia/Jakarta',
    ),
    worldtimeapi(
      location: 'Malta',
      flag: 'malta.png',
      url: 'Europe/Malta',
    ),
    worldtimeapi(
      location: 'Riyadh',
      flag: 'riyadh.png',
      url: 'Asia/Riyadh',
    ),
    worldtimeapi(
      location: 'Dubai',
      flag: 'dubai.png',
      url: 'Asia/Dubai',
    ),
    worldtimeapi(
      location: 'Kolkata',
      flag: 'india.png',
      url: 'Asia/Kolkata',
    ),
  ];
  void updateTime(index) async {
    worldtimeapi inst = locations[index];
    await inst.getTime();
    Navigator.pop(context, {
      'location': inst.location,
      'timezone': inst.timezone,
      'flag': inst.flag,
      'time': inst.time,
      'isDayTime': inst.isDayTime,
      'isEveningTime': inst.isEveningTime,
      'isNightTime': inst.isNightTime,
      'isMorningTime': inst.isMorningTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text(
          "Choose Location",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue[200],
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  // setState(() {
                  //   updateTime(index);
                  // });
                  updateTime(index);

                  print(locations[index].location);
                },
                title: Text(
                  locations[index].location,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
