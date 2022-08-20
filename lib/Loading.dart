import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:time_machine/world_time_api.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTimeCall() async {
    worldtimeapi api = worldtimeapi(
        location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata');
    await api.getTime();
    setState(() {});
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': api.location,
        'timezone': api.timezone,
        'flag': api.flag,
        'time': api.time,
        'isDayTime': api.isDayTime,
        'isEveningTime': api.isEveningTime,
        'isNightTime': api.isNightTime,
        'isMorningTime': api.isMorningTime
      });
    });
  }

  @override
  void initState() {
    super.initState();

    getTimeCall();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue[200],
        child: SpinKitThreeBounce(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
