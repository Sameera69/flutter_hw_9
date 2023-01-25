import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wifi Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Wifi Map'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);
  final CameraPosition _initialPosition = const CameraPosition(target: LatLng(26.8206, 30.8025));
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back),
                  Text(widget.title),
                  const Icon(Icons.search),
                  const Icon(Icons.menu),
                ],
              ),
            ),
            SizedBox(
              height: 400,
              width: 400,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
              ),
            ),
            Container(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children: const [
                        Text('Lorem Hotel'),
                        Text('ipsum st.'),
                      ],
                    ),
                    const Icon(Icons.arrow_circle_up_sharp),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
