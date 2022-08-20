import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class worldtimeapi {
  String time;
  String timezone;
  String location;
  String flag;
  String url;
  bool isDayTime;
  bool isEveningTime;
  bool isNightTime;
  bool isMorningTime;

  worldtimeapi(
      {this.location,
      this.flag,
      this.url,
      this.isDayTime,
      this.isEveningTime,
      this.isNightTime,
      this.isMorningTime});

  Future<void> getTime() async {
    Response responce = await get('https://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(responce.body);

    String TimeZone = data['timezone'];
    String DateandTime = data['utc_datetime'];
    String Offset = data['utc_offset'].substring(1, 3);

    DateTime now = DateTime.parse(DateandTime);
    now = now.add(Duration(hours: int.parse(Offset)));
    print(Offset);

    // if (now.hour > 5 && now.hour < 16) {
    //   isDayTime = true;
    // } else {
    //   isDayTime = false;
    // }
    // if (now.hour > 17 && now.hour < 20) {
    //   isEveningTime = true;
    // } else {
    //   isEveningTime = false;
    // }
    // if (now.hour > 21 && now.hour < 24) {
    //   isNightTime = true;
    // } else {
    //   isNightTime = false;
    // }
    isMorningTime = (now.hour >= 1 && now.hour <= 5) ? true : false;
    isDayTime = (now.hour >= 6 && now.hour <= 16) ? true : false;
    isEveningTime = (now.hour >= 17 && now.hour <= 20) ? true : false;
    isNightTime = (now.hour >= 21 && now.hour <= 24) ? true : false;
    // isDayTime = now.hour > 6 && now.hour < 23 ? true : false;

    time = DateFormat.jm().format(now);

    timezone = TimeZone;
  }
}
