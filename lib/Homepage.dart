import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String apiKey =
      'http://api.weatherapi.com/v1/current.json?key=f001849e1e844bffbbc95620240910&q=newyork'; // Replace with your OpenWeatherMap API key
  String city = 'New York';
  Weatherdata? todayWeather;

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    final todayWeatherResponse = await http.get(
      Uri.parse(
          'http://api.weatherapi.com/v1/current.json?key=f001849e1e844bffbbc95620240910&q=thrissur'),
    );
    print(todayWeatherResponse.body);

    if (todayWeatherResponse.statusCode == 200) {
      setState(() {
        todayWeather = weatherdataFromJson(todayWeatherResponse.body);

        print(todayWeather!.current.tempC);
      });
    }

    // Fetch weather data for other cities
  }
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
          SizedBox(width: 500),
          Center(
            child: Text(
              'Today',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          SizedBox(width: 500),
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 11, 47, 76),
    ),
    body: todayWeather == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 7, 64, 110),
                  const Color.fromARGB(255, 2, 28, 41)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Sunny icon added here
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Icon(
                      Icons.wb_sunny,
                      size: 100,
                      color: Colors.yellow, // Change color if needed
                    ),
                  ),
                  // Today's Weather Row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Weather Condition
                        Column(
                          children: [
                            Icon(
                              Icons.wb_sunny, // Weather icon
                              size: 50,
                              color: Colors.white,
                            ),
                            Text(
                              todayWeather!.current.lastUpdated,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        // Temperature
                        Column(
                          children: [
                            Icon(
                              Icons.thermostat, // Temperature icon
                              size: 50,
                              color: Colors.white,
                            ),
                            Text(
                              '${todayWeather!.current.tempC}°C',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        // City
                        Column(
                          children: [
                            Icon(
                              Icons.location_city, // Logo icon
                              size: 50,
                              color: Colors.white,
                            ),
                            Text(
                              city, // Current city
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Weather Details: Wind, Humidity, Precipitation
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Wind Information
                        Column(
                          children: [
                            Icon(
                              Icons.air, // Wind icon
                              size: 50,
                              color: Colors.white,
                            ),
                            Text(
                              'Wind',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '${todayWeather!.current.windDegree}m/s ',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        // Humidity Information
                        Column(
                          children: [
                            Icon(
                              Icons.opacity, // Humidity icon
                              size: 50,
                              color: Colors.white,
                            ),
                            Text(
                              'Humidity',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '${todayWeather!.current.humidity}%',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        // Precipitation Information
                        Column(
                          children: [
                            Icon(
                              Icons.grain, // Precipitation icon
                              size: 50,
                              color: Colors.white,
                            ),
                            Text(
                              'Precipitation',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'N/A', // Precipitation data not directly available
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Section for Other Cities' Weather
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Next 7 Days Weather in Other Cities',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    bottomNavigationBar: BottomAppBar(
      color: const Color.fromARGB(255, 1, 27, 49),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    ),
  );
}
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//               icon: Icon(Icons.settings, color: Colors.white),
//               onPressed: () {},
//             ),
//             SizedBox(width: 500),
//             Center(
//               child: Text(
//                 'Today',
//                 style: TextStyle(fontSize: 20, color: Colors.white),
//               ),
//             ),
//             SizedBox(width: 500),
//             IconButton(
//               icon: Icon(Icons.menu, color: Colors.white),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         backgroundColor: const Color.fromARGB(255, 11, 47, 76),
//       ),
//       body: todayWeather == null
//           ? Center(
//               child: CircularProgressIndicator(),
//             ):
          
//           Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [const Color.fromARGB(255, 7, 64, 110), const Color.fromARGB(255, 2, 28, 41)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               // Today's Weather Row
              
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Weather Condition
//                       Column(
//                         children: [
//                           Icon(
//                             Icons.wb_sunny, // Weather icon
//                             size: 50,
//                             color: Colors.white,
//                           ),
//                           Text(
//                             todayWeather!.current.lastUpdated,
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                       // Temperature
//                       Column(
//                         children: [
//                           Icon(
//                             Icons.thermostat, // Temperature icon
//                             size: 50,
//                             color: Colors.white,
//                           ),
//                           Text(
//                             '${todayWeather!.current.tempC}°C',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                       // City
//                       Column(
//                         children: [
//                           Icon(
//                             Icons.location_city, // Logo icon
//                             size: 50,
//                             color: Colors.white,
//                           ),
//                           Text(
//                             city, // Current city
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 // Weather Details: Wind, Humidity, Precipitation
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Wind Information
//                       Column(
//                         children: [
//                           Icon(
//                             Icons.air, // Wind icon
//                             size: 50,
//                             color: Colors.white,
//                           ),
//                           Text(
//                             'Wind',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           Text(
//                             '${todayWeather!.current.windDegree}m/s ',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                       // Humidity Information
//                       Column(
//                         children: [
//                           Icon(
//                             Icons.opacity, // Humidity icon
//                             size: 50,
//                             color: Colors.white,
//                           ),
//                           Text(
//                             'Humidity',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           Text(
//                             '${todayWeather!.current.humidity}%',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                       // Precipitation Information
//                       Column(
//                         children: [
//                           Icon(
//                             Icons.grain, // Precipitation icon
//                             size: 50,
//                             color: Colors.white,
//                           ),
//                           Text(
//                             'Precipitation',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           Text(
//                             'N/A', // Precipitation data not directly available
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 // Section for Other Cities' Weather
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Next 7 Days Weather in Other Cities',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       SizedBox(height: 10),
                      
//                     ],
//                   ),
//                 ),
//               ] 
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         color: const Color.fromARGB(255, 1, 27, 49),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//               icon: Icon(Icons.home, color: Colors.white),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: Icon(Icons.settings, color: Colors.white),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: Icon(Icons.shopping_cart, color: Colors.white),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: Icon(Icons.notifications, color: Colors.white),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: Icon(Icons.person, color: Colors.white),
//               onPressed: () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CityWeatherRow extends StatelessWidget {
//   final String city;
//   final String condition;
//   final String temperature;

//   CityWeatherRow(
//       {required this.city, required this.condition, required this.temperature});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             city,
//             style: TextStyle(fontSize: 18, color: Colors.white),
//           ),
//           Text(
//             condition,
//             style: TextStyle(fontSize: 18, color: Colors.white),
//           ),
//           Text(
//             temperature,
//             style: TextStyle(
//                 fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }
// 