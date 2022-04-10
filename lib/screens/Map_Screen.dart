import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import '../widgets/app_drawer.dart';
class MyMapp extends StatelessWidget {
  static const routeName = '/Map';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Map'),

      ),
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
            markers:[
              new Marker(
                width: 45.0,
                height: 45.0,
                point: new LatLng(40.71, -74.00),
                builder: (context) => new Container(
                  child : IconButton(
                    icon: Icon(Icons.location_on),
                    color: Colors.green,
                    iconSize: 45.0,
                    onPressed: (){
                      print('tapee');
                    },
                  )
                )

              )
            ]
          )
        ]),
        drawer: AppDrawer(),
    );
  }
}


