import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Include generated file
part 'counter.g.dart';

// This is the class used by rest of your codebase
class Counter = _Counter with _$Counter;

// The store-class
abstract class _Counter with Store {
  @observable
  int index = 0;

  int orderNumber = 2707;
  String fName = 'Adekomi';
  String sName = 'Adeleye';
  String phoneNumber = '08033333333';
  double rating = 4.5;
  String location = '';
  String price = '10,300';
  String size = 'Medium';

  @action
  String fullName() {
    return fName + sName;
  }

  @action
  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @action
  getUserLocation() {}

  @computed
  String get fullNam => '$fName $sName';
  String get orderCode => '#$orderNumber';
}
