import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:test_app/models/Country.dart';
import 'package:http/http.dart' as http;

class CountryProvider  extends ChangeNotifier{
  List<Country> _countries = [];
  List<Country> filteredCountries = []; // Add a list to store filtered countries

  List<Country> get countries => _countries;
  Future<dynamic> fetchCountries() async {

    final Uri url = Uri.parse('https://restcountries.com/v3.1/all');

    try {
     final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        _countries = data.map((item) => Country(item['name']['common'], item['cca2'])).toList();
        filteredCountries = _countries;
        notifyListeners();
      } else {
        // Handle API errors gracefully (e.g., show error message)
        print('Failed to load countries: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network errors
      print('Error fetching countries: $error');
    }
  }
  void filterCountries(String searchTerm) {
    if(searchTerm.isEmpty){
      filteredCountries = _countries;
      notifyListeners();
    }else{
      filteredCountries = _countries.where((country) => country.name.toLowerCase().contains(searchTerm.toLowerCase())).toList();
      notifyListeners(); // Notify listeners about changes in filtered list
    }

  }

}