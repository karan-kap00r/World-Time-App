import 'package:http/http.dart'as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:core';

class WorldTime{

  late String location;  //location name
  late String time;      //time in that location
  late String flag;      //url to an asset flag icon
  late bool isDayTime;       //if it is daytime or not
  String urli;       //location url for API endpoint

  WorldTime({required this.location,required this.flag,required this.urli});

  Future<void> getTime() async{
    try{
      // var dio = Dio();
      // final response = await dio.get('https://worldtimeapi.org/api/timezone/Europe/London');
      // print(response.data["utc_datetime"]);

      var url = Uri.parse('https://worldtimeapi.org/api/timezone/$urli');
      http.Response response = await http.get(url);
      Map data= jsonDecode(response.body);
      // print(data["utc_datetime"]);
      String datetime=data["datetime"];


      //create Datetime object
      DateTime parseDate =
      new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").parse(datetime);
      var inputDate = DateTime.parse(parseDate.toString());
      var outputFormat = DateFormat('hh:mm a');       // MM/dd/yyyy
      var outputDate = outputFormat.format(inputDate);
      print(outputDate);

      //set the time property
      isDayTime= parseDate.hour>6 && parseDate.hour<20 ? true: false;
      time=outputDate.toString();

    }
    catch(e){
      print('caught error: $e');
      time='could not get time data';
    }

  }

}


