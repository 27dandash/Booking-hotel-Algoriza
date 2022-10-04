import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shop_app/shared/components/constants.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../hotel_discrpition/hotel_discription.dart';

class MapInitial extends StatefulWidget {
  @override
  State<MapInitial> createState() => MapInitialState();
}

class MapInitialState extends State<MapInitial> {
  late GoogleMapController _controller;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30, 31),
    zoom: 10.0,
  );

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appTranslation(context).map,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body:  Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            mapType: MapType.normal,
            zoomControlsEnabled: true,
            mapToolbarEnabled: true,
            compassEnabled: true,

            markers: markers.values.toSet(),
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) async {
              _controller = controller;

              const LocationSettings locationSettings = LocationSettings(
                accuracy: LocationAccuracy.best,
                distanceFilter: 100,
              );

              Geolocator.getPositionStream(
                locationSettings: locationSettings,
              ).listen((Position value) {
                final marker = Marker(
                  markerId: const MarkerId('place_name'),
                  position: LatLng(
                    value.latitude,
                    value.longitude,
                  ),
                  infoWindow: const InfoWindow(
                    title: 'title',
                    snippet: 'address',
                  ),
                );

                setState(() {
                  markers[const MarkerId('place_name')] = marker;
                });

                _controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLng(
                        value.latitude,
                        value.longitude,
                      ),
                      zoom: 17.0,
                    ),
                  ),
                );
              });

              determinePosition().then((value) {
                _controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLng(
                        value.latitude,
                        value.longitude,
                      ),
                      zoom: 16.0,
                    ),
                  ),
                );
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 250.0,
                width: MediaQuery.of(context).size.width,
                child:  BlocConsumer<AppCubit, AppState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    var cubit = AppCubit.get(context).hotelModel;
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30),

                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Column(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 150,
                                  width: 250,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image(
                                          fit: BoxFit.fitWidth,
                                          image: NetworkImage(
                                              'http://api.mahmoudtaha.com/images/${cubit!.data![index].images[index]}')))),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 310,
                                    child: Text(
                                      cubit.data![index].name,
                                      maxLines: 1,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(
                                      width: 250,
                                      child: Text(
                                        cubit.data![index].address,
                                        maxLines: 1,
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  Row(
                                    children: [
                                      Text('Price : '),
                                      Text(
                                        cubit.data![index].price,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text(' per night')
                                    ],
                                  ),
                                  Container(
                                    width: 250,
                                    height: 30,
                                    child: MaterialButton(

                                      color: Colors.black,
                                      height: 1,
                                      onPressed: (){},child: Text(appTranslation(context).details,style: TextStyle(color: Colors.blue),),),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 5,
                      ),
                      itemCount: cubit!.data!.length-2,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      // Stack(
      //   children: [
      //     SizedBox(
      //       child: GoogleMap(
      //         myLocationEnabled: true,
      //         myLocationButtonEnabled: true,
      //         mapType: MapType.normal,
      //         zoomControlsEnabled: true,
      //         mapToolbarEnabled: true,
      //         compassEnabled: true,
      //
      //         markers: markers.values.toSet(),
      //         initialCameraPosition: _kGooglePlex,
      //         onMapCreated: (GoogleMapController controller) async {
      //           _controller = controller;
      //
      //           const LocationSettings locationSettings = LocationSettings(
      //             accuracy: LocationAccuracy.best,
      //             distanceFilter: 100,
      //           );
      //
      //           Geolocator.getPositionStream(
      //             locationSettings: locationSettings,
      //           ).listen((Position value) {
      //             final marker = Marker(
      //               markerId: const MarkerId('place_name'),
      //               position: LatLng(
      //                 value.latitude,
      //                 value.longitude,
      //               ),
      //               infoWindow: const InfoWindow(
      //                 title: 'title',
      //                 snippet: 'address',
      //               ),
      //             );
      //
      //             setState(() {
      //               markers[const MarkerId('place_name')] = marker;
      //             });
      //
      //             _controller.animateCamera(
      //               CameraUpdate.newCameraPosition(
      //                 CameraPosition(
      //                   target: LatLng(
      //                     value.latitude,
      //                     value.longitude,
      //                   ),
      //                   zoom: 17.0,
      //                 ),
      //               ),
      //             );
      //           });
      //
      //           determinePosition().then((value) {
      //             _controller.animateCamera(
      //               CameraUpdate.newCameraPosition(
      //                 CameraPosition(
      //                   target: LatLng(
      //                     value.latitude,
      //                     value.longitude,
      //                   ),
      //                   zoom: 16.0,
      //                 ),
      //               ),
      //             );
      //           });
      //         },
      //       ),
      //     ),
      //
      //     BlocConsumer<AppCubit, AppState>(
      //       listener: (context, state) {
      //         // TODO: implement listener
      //       },
      //       builder: (context, state) {
      //         var cubit = AppCubit.get(context).hotelModel;
      //         return ListView.separated(
      //           scrollDirection: Axis.horizontal,
      //           itemBuilder: (context, index) => Padding(
      //             padding: const EdgeInsets.all(4),
      //             child: Column(
      //               //   mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 SizedBox(
      //                     height: 150,
      //                     width: 250,
      //                     child: ClipRRect(
      //                         borderRadius: BorderRadius.circular(30),
      //                         child: Image(
      //                             fit: BoxFit.fitWidth,
      //                             image: NetworkImage(
      //                                 'http://api.mahmoudtaha.com/images/${cubit!.data![index].images[index]}')))),
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     SizedBox(
      //                       width: 310,
      //                       child: Text(
      //                         cubit.data![index].name,
      //                         maxLines: 1,
      //                         style: TextStyle(fontSize: 15),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                         width: 250,
      //                         child: Text(
      //                           cubit.data![index].address,
      //                           maxLines: 1,
      //                           style: TextStyle(fontSize: 15),
      //                         )),
      //                     Row(
      //                       children: [
      //                         Text('Price : '),
      //                         Text(
      //                           cubit.data![index].price,
      //                           style: TextStyle(color: Colors.blue),
      //                         ),
      //                         Text(' per night')
      //                       ],
      //                     ),
      //                     Row(
      //                       children: [
      //                         const Icon(
      //                           Icons.star_rounded,
      //                           color: Colors.yellow,
      //                           size: 20,
      //                         ),
      //                         const Icon(
      //                           Icons.star_rounded,
      //                           color: Colors.yellow,
      //                           size: 20,
      //                         ),
      //                         const Icon(
      //                           Icons.star_rounded,
      //                           color: Colors.yellow,
      //                           size: 20,
      //                         ),
      //                         const Icon(
      //                           Icons.star_rounded,
      //                           color: Colors.yellow,
      //                           size: 20,
      //                         ),
      //                         const Icon(
      //                           Icons.star_half_sharp,
      //                           color: Colors.yellow,
      //                           size: 20,
      //                         ),
      //                         const SizedBox(
      //                           width: 5,
      //                         ),
      //                         Text(
      //                           cubit.data![index].rate,
      //                           style: const TextStyle(
      //                               color: Colors.blue, fontSize: 15),
      //                         )
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //           shrinkWrap: true,
      //           separatorBuilder: (context, index) => const SizedBox(
      //             width: 5,
      //           ),
      //           itemCount: cubit!.data!.length-2,
      //         );
      //       },
      //     ),
      //   ],
      // ),

      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: const Text('To the lake!'),
      //   icon: const Icon(Icons.directions_boat),
      // ),
    );
  }

  void _goToTheLake() async {
    _controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
  }
}

// AIzaSyACbkNR08VnxiIfnekxOfMV6TLuCcNoox8

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
