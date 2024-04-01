import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/common/styles.dart';


class DropDownView extends StatelessWidget {
   DropDownView({
     this.showDocsOptions,
     this.selectedValue= '',
     this.showDropArrow = true,
     this.hintText ='Type',
     this.icon = Icons.arrow_drop_down,
     this.iconColor = const Color(0xFF6E6E73),
     Key? key}) : super(key: key);

  Function()? showDocsOptions;
  String selectedValue;
  bool showDropArrow;
  String hintText;
  IconData? icon;
  Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 50,
      decoration: selectedValue.isEmpty ? outlineBorder : outlineBorderWithPinkBg,
      child: _buildChildWidgetView(context),
    );
  }
  Widget _buildChildWidgetView(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
      child: InkWell(
        onTap: showDocsOptions,
        child: Row(
          children: [
            _buildViewWithValue(),
            Expanded(child: Container()),
            if(showDropArrow)
            Icon(icon,color: iconColor,)
          ],
        ),
      ),
    );
  }
  Widget _buildViewWithValue(){
    if(selectedValue.isEmpty){
      return  Text(hintText,
        style: greyText14FF,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(hintText,
          style: greyText10FF,
        ),
        Text(selectedValue,
          style: whiteText12,
        ),
      ],
    );
  }
}
