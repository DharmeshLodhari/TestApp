import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:test_app/common/constants.dart';
import 'package:test_app/common/styles.dart';
import 'package:test_app/common/utils.dart';

class ZoomableImageView extends StatelessWidget {
  ZoomableImageView({
    required this.file,
    required this.isCardView,
    required this.profilePhotoViewController,
    required this.cardPhotoViewController,
    this.isPhotoEditingDoneForProfile = false,
    this.isPhotoEditingDoneForCard = false,
    this.repaintKey,
    this.repaintKeyForCard,
    super.key,
  });
  final GlobalKey? repaintKey;
  final GlobalKey? repaintKeyForCard;
  final bool isPhotoEditingDoneForProfile;
  final bool isPhotoEditingDoneForCard;
  Color borderColor = grey;
  final File? file;
  final bool isCardView;
  final PhotoViewController profilePhotoViewController;
  final PhotoViewController cardPhotoViewController;

  Widget _buildBody(BuildContext context) {
    return _buildImageShape(context);
  }

  Widget _buildImageShape(BuildContext context) {
    return IndexedStack(
      index: isCardView ? 0 : 1,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
          child: Center(
            child: Container(
              width: Utils().getWidthOfCard(context),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(0),
                ),
                border: Border.all(
                  color: borderColor,
                  width: 10.0,
                ),
              ),
              child: RepaintBoundary(
                key: repaintKeyForCard,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),

                  child: PhotoView(


                    controller: cardPhotoViewController,
                    imageProvider: FileImage(
                      file!,

                    ),
                    enableRotation: true,
                    wantKeepAlive: true,
                  ),
                ),
              ),
            ),
          ),
        ),

        Container(


          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 20),
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.all(5.0),
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(150),
              ),
              color: black,
              border: Border.all(
                color: borderColor,
                width: 4.0,
              ),
            ),
            child: RepaintBoundary(
              key: repaintKey,
              child:
              ClipOval(
                child: PhotoView(

                  controller: profilePhotoViewController,
                  imageProvider: FileImage(
                    file!,
                  ),
                  enableRotation: true,
                  wantKeepAlive: true,
                ),
              ),

            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isPhotoEditingDoneForProfile && isCardView == false) {
      borderColor = pink;
    }
    if (isPhotoEditingDoneForCard && isCardView) {
      borderColor = pink;
    }
    return Column(
      children: [

        Expanded(child: _buildBody(context)),

        Text(
          _getPhotoAdjustText(),
          style: pinkText13,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          _getPhotoDoneStatusText(),
          style: greyText12,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  String _getPhotoAdjustText() {
    if (isPhotoEditingDoneForProfile && isCardView == false) {
      return strPhotoAdjustDoneText;
    }
    if (isPhotoEditingDoneForCard && isCardView) {
      return strPhotoAdjustDoneText;
    }
    if(isCardView){
      return strCROPYOURPHOTO;
    }
    return strPhotoAdjustText;
  }

  String _getPhotoDoneStatusText() {
    if (isPhotoEditingDoneForProfile && isCardView == false) {
      return strNextPhotoText;
    }
    if (isPhotoEditingDoneForCard && isCardView) {
      return strNextPhotoText;
    }
    return strPhotoAdjustText1;
  }
}
