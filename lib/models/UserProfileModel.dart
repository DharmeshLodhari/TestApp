import 'dart:io';

import 'package:test_app/models/Country.dart';

class UserProfileModel {

  String? selectedDoc = '';
  String? contactNumber = '';
  Country? selctedCountry;
  String? imageFileName = '';
  File? imageFile =  null;

}