

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import '../widgets/app_drawer.dart';
import 'package:geocoder/geocoder.dart';

class MyMarker extends StatelessWidget {
  static const routeName = '/MapMarker';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyMarkerPage(),
    );
  }
}
class MyMarkerPage extends StatefulWidget{
  @override
  _MyMarkerPageState createState () => new _MyMarkerPageState();
}
class _MyMarkerPageState extends State<MyMarkerPage>{
  List <Marker> allMarkers =[];
    setMarkers() {
      return allMarkers;
    }
    addToList() async{
      final coordinates = new Coordinates(1.10, 45.50);
      var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;
      setState((){
        allMarkers.add(
            new Marker(
            width: 45.0,
            height: 45.0,
            point: new LatLng(first.coordinates.latitude,first.coordinates.longitude),
            builder: (context) => new Container(
                child : IconButton(
                  icon: Icon(Icons.location_on),
                  color: Colors.green,
                  iconSize: 45.0,
                  onPressed: (){
                    print(first.featureName);
                  },
                ),
            )

        ));
        
      });
    }
    Future addMarker() async{
      await showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context){
            return new SimpleDialog(
              title: new Text('Ajouter Marker',
                style : new TextStyle (fontSize: 17.0),
              ),
              children: <Widget>[
                new SimpleDialogOption(
                  child: new Text ('Ajoutee',
                    style: new TextStyle(color: Colors.green),
                  ),
                  onPressed: (){
                    addToList();
                    Navigator.of(context).pop();

                  },
                )
              ],
            );
          }

      );
    }
  @override
  Widget build(BuildContext context) {
    print('building Map');
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
      ),
      drawer: AppDrawer(),
      body: new FlutterMap(
          options: new MapOptions(
              center: new LatLng(40.71, -74.00),
              minZoom: 10.0
          ),
          layers: [
            new TileLayerOptions(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains : [ 'a' , 'b' , 'c']

            ),
            new MarkerLayerOptions(
                markers: setMarkers()
            )
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: addMarker,
        child: Icon(Icons.add),
      ), // This trailing comma mak

    );
  }


}


