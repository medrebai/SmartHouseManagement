import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sightfinal/screens/graph.dart';
import 'package:sightfinal/screens/splitscreen/splitscreen.dart';
import '../../../util/smart_devices_box.dart';
import '../../constants/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // padding constants
  final double horizontalPadding = 0.1;
  final double verticalPadding = 0.03;

  // list of smart devices
  List mySmartDevices = [
    // [ smartDeviceName, iconPath , powerStatus ]
    [" Light", "lib/icons/light-bulb.png", true],
    [" AC", "lib/icons/air-conditioner.png", false],
    ["TV", "lib/icons/smart-tv.png", false],
    ["Fan", "lib/icons/fan.png", false],
  ];
  // power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // app bar
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * horizontalPadding,
                  vertical: MediaQuery.of(context).size.height * verticalPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // menu icon
                      CupertinoButton(
                      child: const Icon(
                        Icons.graphic_eq_outlined,
                        size: 45,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        Routes.instance.push(widget: Stats(), context: context);
                      },
                    ),
                    // account icon
                    CupertinoButton(
                      onPressed: () {
                        Routes.instance.push(
                            widget: ConsumptionManagementPage(),
                            context: context);
                      },
                      child: const Icon(
                        Icons.home,
                        size: 45,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // welcome home
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * horizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Here, You Manage your",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          color: Colors.grey.shade800),
                    ),
                    Text(
                      'Electronics',
                      style: GoogleFonts.bebasNeue(
                        fontSize: MediaQuery.of(context).size.width * 0.1,
                        color: Colors.green, // Set the color to green
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Divider(
                  thickness: 1,
                  color: Color.fromARGB(255, 204, 204, 204),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * horizontalPadding),
                child: Text(
                  "Your Smart Devices",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
              const SizedBox(height: 10), // grid
              GridView.builder(
                shrinkWrap: true, // Added to enable scrolling
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
