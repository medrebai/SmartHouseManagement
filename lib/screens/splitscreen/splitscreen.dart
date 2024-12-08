import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sightfinal/constants/routes.dart';

import '../profile/profile.dart';
import '../water_management_screen/water_Managemen_screen.dart';
import 'electricitymanagement.dart';

class ConsumptionManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Menu icon
                    Image.asset(
                      'lib/icons/menu.png',
                      height: 30,
                      color: Colors.grey[800],
                    ),
                    // Account icon
                    CupertinoButton(
                      onPressed: () {
                        Routes.instance.push(widget: SettingsScreen(), context: context);
                      },
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                // Welcome message
                Text(
                  "Consumption Management,",
                  style: TextStyle(fontSize: 24, color: Colors.grey.shade800),
                ),
                Text(
                  'Home Page',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 48,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(
                  thickness: 1,
                  color: Color.fromARGB(255, 204, 204, 204),
                ),
                const SizedBox(height: 25),
                // Split images for water and electricity management
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Routes.instance.push(widget: const WaterManagementPage(), context: context);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.green,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                image: AssetImage('lib/icons/waterdrop.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Water Management',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Routes.instance.push(widget: const HomePage(), context: context);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.green,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                image: AssetImage('lib/icons/electricity_image.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Electricity Management',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                // Additional advice section
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tips for Efficient Usage:',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '1. Turn off lights and appliances when not in use.',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Text(
                        '2. Use energy-efficient appliances to save electricity.',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Text(
                        '3. Fix any leaks in faucets or pipes to conserve water.',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      // Add more tips as needed
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
