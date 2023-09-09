import 'package:apms_project/Controller/ParkingController/parking_spot_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  @override
  Widget build(BuildContext context) {
    // final parkingController = Provider.of<ParkingSpotProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          // Experimental
          child: Consumer<ParkingSpotProvider>(builder: (context , value , child){
           if(value.showDetails){
             return Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(value.selectedParkingSpot.name,style: const TextStyle(fontSize: 20),),
                 Text(value.selectedParkingSpot.location),
                 Image.network(value.selectedParkingSpot.image,width: 80,height: 120,),
               ],
             );
           }else{
             return const CircularProgressIndicator();
           }
          }),
        ),
      ),
    );
  }
}
