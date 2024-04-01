import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/common/constants.dart';
import 'package:test_app/common/styles.dart';
import 'package:test_app/models/Country.dart';
import 'package:test_app/providers/CountryList.dart';
import 'package:test_app/widgets/RoundButton.dart';

class CountryListScreen extends StatefulWidget {
   CountryListScreen({
     this.selectedCountry,
     this.onCountrySelect,
     Key? key}) : super(key: key);

  Country? selectedCountry;
  Function(Country country)? onCountrySelect;

  @override
  _CountryListScreenState createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final countryProvider = Provider.of<CountryProvider>(context);



    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 10,),
          Center(
            child: Text(strCountry,
            style: pinkText22,
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: pink, // Border color
                width: 1.0,          // Border width
              ),
              borderRadius: BorderRadius.circular(4.0), // Border radius
            ),
            child: TextFormField(
              cursorColor: pink,

              style: TextStyle(
                  color: Colors.white
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search,color: grey,),
                contentPadding: EdgeInsets.all(10.0),
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: whiteText14,
              ),
              onChanged: (val){
                countryProvider.filterCountries(val);
              },
            ),
          ),
          const SizedBox(height: 10,),
          Text(strCountries,
            style: greyText14Bold,
          ),
          const SizedBox(height: 10,),
          Expanded(child: _buildCountryList(countryProvider)),



        ],
      ),
    );
  }
  Widget _buildCountryList(CountryProvider provider){
    if(provider.filteredCountries.isEmpty){
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(pink),
        ),
      );
    }
    return ListView.builder(
      itemCount: provider.filteredCountries.length,
      shrinkWrap: true,
      itemBuilder: (context,index){
    
        return  Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: InkWell(
            onTap: (){
              widget.onCountrySelect!(provider.filteredCountries[index]);
              provider.filterCountries('');
              Navigator.of(context).pop();
            },
            child: Row(
              children: [
                Text(provider.filteredCountries[index].name,
                  style: greyText12,
                ),
                Expanded(child: Container()),
                _buildIcon(provider.filteredCountries[index].name),
    
              ],
            ),
          ),
        );
      },
    
    );
  }
  Widget _buildIcon(String countryName){
    if(widget.selectedCountry == null){
      return Container();
    }
    if(widget.selectedCountry!.name == countryName){
      return Image.asset('assets/ic_flag.png');
    }
    return Container();
  }
}
