import 'package:apms_project/Controller/provider/slotbutton.dart';
import 'package:apms_project/Utils/responsive_util.dart';
import 'package:apms_project/Controller/provider/pickdate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Timeslot extends StatefulWidget {
  const Timeslot({super.key});

  @override
  State<Timeslot> createState() => _TimeslotState();
}

class _TimeslotState extends State<Timeslot> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ButtonController>(context);
    Provider.of<datepickprovider>(context);
    return Scaffold(appBar: AppBar(
        title: Consumer<ButtonController>(builder: (context, value, child) {
      return Text(value.selectedslot);
    })), body: Consumer<datepickprovider>(builder: (context, value, child) {
      return Column(children: [
        const SizedBox(
          height: 20,
        ),
        Container(
            width: double.infinity,
            height: ResponsiveUtils.screenHeight(context) * 0.05,
            margin: const EdgeInsets.only(right: 20, left: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: const Color.fromARGB(255, 219, 219, 219)),
                onPressed: () async {
                  value.Datepicker(context);
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.black,
                        size: ResponsiveUtils.screenWidth(context) * 0.06,
                      ),
                      Text(
                        value.formattedDate,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                ResponsiveUtils.screenWidth(context) * 0.04),
                      ),
                      Icon(Icons.keyboard_arrow_down_rounded,
                          size: ResponsiveUtils.screenWidth(context) * 0.06,
                          color: Colors.black)
                    ],
                  ),
                ))),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  child: Text(
                    "Starting time",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: ResponsiveUtils.screenWidth(context) * 0.04),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: ResponsiveUtils.screenWidth(context) * 0.4,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor:
                              const Color.fromARGB(255, 219, 219, 219)),
                      onPressed: () async {
                        value.Starttimepicker(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              value.Starttime,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      ResponsiveUtils.screenWidth(context) *
                                          0.04),
                            ),
                            Icon(Icons.keyboard_arrow_down_rounded,
                                size:
                                    ResponsiveUtils.screenWidth(context) * 0.06,
                                color: Colors.black)
                          ],
                        ),
                      )),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  child: Text(
                    "Ending time",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: ResponsiveUtils.screenWidth(context) * 0.04),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: ResponsiveUtils.screenWidth(context) * 0.4,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor:
                              const Color.fromARGB(255, 219, 219, 219)),
                      onPressed: () async {
                        value.Endtimepicker(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              value.Endtime,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      ResponsiveUtils.screenWidth(context) *
                                          0.04),
                            ),
                            Icon(Icons.keyboard_arrow_down_rounded,
                                size:
                                    ResponsiveUtils.screenWidth(context) * 0.06,
                                color: Colors.black)
                          ],
                        ),
                      )),
                ),
              ],
            )
          ],
        )
      ]);
    }));
  }
}
