import 'package:flutter/material.dart';
import 'package:promykowa_apka/homepage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapaMiasteczkaPage extends StatefulWidget {
  @override
  _MapaMiasteczkaPageState createState() => _MapaMiasteczkaPageState();
}

class _MapaMiasteczkaPageState extends State<MapaMiasteczkaPage> {
  List<Marker> allMarkers = [];

  GoogleMapController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allMarkers.add(Marker(
        markerId: MarkerId('Promyk'),
        draggable: true,
        onTap: () {
          alertMSPromyk(context);
        },
        position: LatLng(50.068006729207035, 19.906203692983308)));

    allMarkers.add(Marker(
        markerId: MarkerId('Wydzial'),
        draggable: true,
        onTap: () {
          alertWydzial(context);
        },
        position: LatLng(50.064836457715764, 19.92352624697659)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Miasteczko AGH Promil'),
      ),
      body: Stack(
          children: [Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              initialCameraPosition:
              CameraPosition(target: LatLng(50.068006729207035, 19.906203692983308), zoom: 12.0),
              markers: Set.from(allMarkers),
              onMapCreated: mapCreated,
            ),
          ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: movetoMiasteczko,
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.red
                  ),
                  child: Icon(Icons.beenhere_outlined, color: Colors.white),
                ),
              ),
            )
          ]
      ),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  movetoMiasteczko() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(50.068006729207035, 19.906203692983308), zoom: 17.0, bearing: 45.0, tilt: 45.0),
    ));
  }

  movetoWydzial() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(50.064836457715764, 19.92352624697659), zoom: 17.0),
    ));
  }
}

void alertMSPromyk(BuildContext context){
  var alertMSpromyk=AlertDialog(
    title: Text("OH YEAH"),
    content: Text("The best dormitory in town"),
  );
  showDialog(
      context: context,
      builder: (BuildContext context){
        return alertMSpromyk;
      }
  );
}

void alertWydzial(BuildContext context){
  var alertwydzial=AlertDialog(
    title: Text("Propably you've lost your bullhead?"),
    content: Text("WGGiOS"),
  );
  showDialog(
      context: context,
      builder: (BuildContext context){
        return alertwydzial;
      }
  );
}