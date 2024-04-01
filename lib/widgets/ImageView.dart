import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:test_app/common/constants.dart';
import 'package:test_app/common/styles.dart';
import 'package:zoom_hover_pinch_image/zoom_hover_pinch_image.dart';

class ZoomableImageView extends StatelessWidget {
   ZoomableImageView({
     required this.file,
     required this.isCardView,
     this.isPhotoEditingDoneForProfile = false,
     this.isPhotoEditingDoneForCard = false,
     this.repaintKey,
     this.repaintKeyForCard,


     Key? key}) : super(key: key);
    GlobalKey? repaintKey ;
    GlobalKey? repaintKeyForCard ;
   bool isPhotoEditingDoneForProfile;
   bool isPhotoEditingDoneForCard;
   Color borderColor = grey;
   File? file;
   bool isCardView;


   Widget _buildBody() {
     return Padding(

       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
       child: Center(
         child: Container(
           decoration: BoxDecoration(

             borderRadius:  BorderRadius.all(
               Radius.circular(isCardView ?0.0:150),
             ),
             border: Border.all(
               color: borderColor,
               width: isCardView ?10.0:4.0,
             ),
           ),
           child: _buildImageShape(),
         ),
       ),
     );
   }
  /* void _handleRotationUpdate(DragUpdateDetails details) {
     setState(() {
       _currentRotation += details.delta.dx / 100; // Adjust sensitivity as needed
     });
   }*/

   Widget _buildImageShape(){
     if(isCardView){
       return RepaintBoundary(
         key: repaintKeyForCard,

         child: ClipRRect(

           borderRadius: BorderRadius.circular(0.0),
           child: PhotoView(

             imageProvider:FileImage(file!)
             //Image.file( file!, fit: BoxFit.cover,),
           ),
         ),
       );
     }
     return RepaintBoundary(
       key: repaintKey,
       child: ClipOval(
         child:
         PhotoView(
           maxScale: 4,
             minScale:1 ,
             imageProvider:FileImage(file!)
           //Image.file( file!, fit: BoxFit.cover,),
         ),
       ),
     );
   }

  @override
  Widget build(BuildContext context) {
   if(isPhotoEditingDoneForProfile && isCardView == false){
     borderColor = pink;
   }
   if(isPhotoEditingDoneForCard && isCardView ){
     borderColor = pink;
   }
    return Column(
      children: [
        Expanded(child: _buildBody()),

        Text(_getPhotoAdjustText(),
          style: pinkText10,
        ),
        const SizedBox(height: 10,),
        Text(_getPhotoDoneStatusText(),
          style: greyText12,
        ),
        const SizedBox(height: 20,),

      ],
    );
  }
  String _getPhotoAdjustText(){
    if(isPhotoEditingDoneForProfile && isCardView == false){
      return strPhotoAdjustDoneText;
    }
    if(isPhotoEditingDoneForCard && isCardView){
      return strPhotoAdjustDoneText;
    }

    return  strPhotoAdjustText;
  }
   String _getPhotoDoneStatusText(){
     if(isPhotoEditingDoneForProfile && isCardView == false){
       return strNextPhotoText;
     }
     if(isPhotoEditingDoneForCard && isCardView){
       return strNextPhotoText;
     }
    return  strPhotoAdjustText1;
   }
}
