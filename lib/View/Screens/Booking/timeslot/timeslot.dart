import 'package:apms_project/Controller/provider/slotbutton.dart';
import 'package:apms_project/Utils/responsive_util.dart';
import 'package:apms_project/Controller/provider/pickdate.dart';
import 'package:apms_project/View/Screens/Payment/paymentGateway.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Timeslot extends StatefulWidget {
  const Timeslot({super.key});

  @override
  State<Timeslot> createState() => _TimeslotState();
}

class _TimeslotState extends State<Timeslot> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<datepickprovider>(context, listen: false).reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ButtonController>(context);
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
            height: ResponsiveUtils.screenHeight(context) * 0.054,
            margin: const EdgeInsets.only(right: 20, left: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
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
                Text(
                  "Starting time",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: ResponsiveUtils.screenWidth(context) * 0.04),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: ResponsiveUtils.screenWidth(context) * 0.4,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
                          backgroundColor:
                              const Color.fromARGB(255, 219, 219, 219)),
                      onPressed: () async {
                        value.starttimepicker(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              value.starttime,
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
                Text(
                  "Ending time",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: ResponsiveUtils.screenWidth(context) * 0.04),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: ResponsiveUtils.screenWidth(context) * 0.4,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
                          backgroundColor:
                              const Color.fromARGB(255, 219, 219, 219)),
                      onPressed: () async {
                        value.endtimepicker(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              value.endtime,
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
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          width: double.infinity,
          height: 60,
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: const Color.fromARGB(255, 223, 222, 222),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Total Amount  :  ${value.amount}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Consumer<ButtonController>(builder: (context, value, child) {
                  return Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: const Text(
                      "",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        PaymentGateway(
          amount: value.amount,
        )
      ]);
    }));
  }
}
