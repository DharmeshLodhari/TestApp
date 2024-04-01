import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test_app/common/constants.dart';
import 'package:test_app/common/styles.dart';

class ProfilePreviewScreen extends StatelessWidget {
   ProfilePreviewScreen({
     this.isPreviewForCard = false,
     this.uint8list,
     Key? key}) : super(key: key);
    bool isPreviewForCard;
   Uint8List? uint8list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: isPreviewForCard ?black:pink,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            _getTitle(),
            const Spacer(),
            InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Image.asset('assets/ic_clear.png',color:isPreviewForCard ?pink:black ,
              fit: BoxFit.fill,
                width: 22,
                height: 22,
              ),
            )

          ],
        ),
      ),
      body: Column(
        children: [
          _buildView(context),
        ],
      ),
    );
  }
  Widget _getTitle(){
    if(isPreviewForCard){
      return  Text(strCardPhoto,
        style: pinkText14,
      );
    }
    return  Text(strPreviewPhotoPlanning,
      style: blackText14Bold,
    );

  }


  Widget _buildView(BuildContext context){
    if(isPreviewForCard){
      return ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            color: pink,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 85,
                  width: 100,
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius:  BorderRadius.all(
                      Radius.circular(0),
                    ),
                    color: black,
                    border: Border.all(
                      color: white,
                      width: 4.0,

                    ),
                  ),
                  child:   ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.memory(uint8list!,
                    fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildlightContainer(200,10),
                    _buildlightContainer(150,10),
                    _buildlightContainer(MediaQuery.of(context).size.width * 0.6,10),
                    _buildlightContainer(MediaQuery.of(context).size.width * 0.6,10),
                    _buildlightContainer(MediaQuery.of(context).size.width * 0.6,10),
                  ],
                )


              ],
            ),
          );
        },

      );
    }
     return Container(
       color: pink,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Center(
             child:
             Container(
               padding: EdgeInsets.all(3.0),
               height: 200,
               width: 200,
               decoration: BoxDecoration(
                 borderRadius:  BorderRadius.all(
                   Radius.circular(150),
                 ),
                 color: pink,
                 border: Border.all(
                   color: white,
                   width: 4.0,

                 ),
               ),
               child: ClipOval(
                 child: Image.memory(uint8list!,
                   fit: BoxFit.cover,
                 ),
               ),
             ),
           ),
           const SizedBox(height: 20,),
         ],
       ),
     );;
  }

  Widget _buildlightContainer(double width,double height){
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.all(
          Radius.circular(6),
        ),
        color: black.withOpacity(0.1),

      ),

    );
  }
}
