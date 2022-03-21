import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time_class.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(urli: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(urli: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(urli: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(urli: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(urli: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(urli: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(urli: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(urli: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index)async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag':instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Location'),
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
              child: ListTile(
              onTap: (){
                updateTime(index);
              },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
              ),
            );
    },
      ),
    );
  }
}


