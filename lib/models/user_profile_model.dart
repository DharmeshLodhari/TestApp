import 'dart:io';

import 'package:test_app/models/country_model.dart';

class UserProfileModel {
  String? selectedDoc = '';
  String? contactNumber = '';
  Country? selctedCountry;
  String? imageFileName = '';
  File? imageFile;
}
