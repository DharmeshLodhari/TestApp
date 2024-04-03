import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photo_view/photo_view.dart';
import 'package:test_app/common/constants.dart';
import 'package:test_app/common/styles.dart';
import 'package:test_app/common/utils.dart';
import 'package:test_app/models/UserProfileModel.dart';
import 'package:test_app/screens/ProfilePreviewScreen.dart';
import 'package:test_app/widgets/AppBarWidget.dart';
import 'package:test_app/widgets/ImageView.dart';
import 'package:test_app/widgets/PhotoAdjustButton.dart';
import 'package:test_app/widgets/RoundButton.dart';

class PhotoPlanningScreen extends StatefulWidget {
  PhotoPlanningScreen({
    required this.userProfileModel,
    super.key,
  });

  UserProfileModel userProfileModel;

  @override
  _PhotoPlanningScreenState createState() => _PhotoPlanningScreenState();
}

class _PhotoPlanningScreenState extends State<PhotoPlanningScreen> {
  bool isPhotoEditingDoneForProfile = false;
  bool isPhotoEditingDoneForCard = false;
  bool showCardView = false;
  final GlobalKey repaintKey = GlobalKey();
  PhotoViewController profilePhotoViewController = PhotoViewController();
  PhotoViewController cardPhotoViewController = PhotoViewController();
  final GlobalKey repaintKeyForCard = GlobalKey();
  Uint8List? _imageBytes;
  int pointersCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: AppBarView(
          showSkip: false,
          useExpanded: false,
          title: strPhotoPlanning,
          onTapSkip: () {},
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14),
        child: _build(),
      ),
    );
  }

  void _navigateToProfilePreviewScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfilePreviewScreen(
          isPreviewForCard: showCardView,
          uint8list: _imageBytes,
        ),
      ),
    );
  }

  Widget _build() {
    return Listener(
      onPointerDown: (e) => setState(() => pointersCount++),
      onPointerUp: (e) => setState(() => pointersCount--),
      child: Column(
        children: [
          _buildSwipeButton(),
          const SizedBox(height: 18,),
          SizedBox(
            height: Utils().getHeightOfPhoto(context, showCardView),
            child: ZoomableImageView(
                repaintKey: repaintKey,
                repaintKeyForCard: repaintKeyForCard,
                file: widget.userProfileModel.imageFile,
                isCardView: showCardView,
                isPhotoEditingDoneForProfile: isPhotoEditingDoneForProfile,
                isPhotoEditingDoneForCard: isPhotoEditingDoneForCard,
                profilePhotoViewController: profilePhotoViewController,
                cardPhotoViewController: cardPhotoViewController),
          ),
          const SizedBox(height: 10,),
          InkWell(
            onTap: () {
              if (showCardView) {
                isPhotoEditingDoneForCard = true;
              } else {
                isPhotoEditingDoneForProfile = true;
              }
              setState(() {});
            },
            child: PhotoAdjustButton(
              btnColor: _getButtonColor(),
            ),
          ),
          const SizedBox(height: 23),
          RoundButton(
            btnOpacity:
                isPhotoEditingDoneForProfile && isPhotoEditingDoneForCard
                    ? 1.0
                    : 0.4,
            bgColor: pink,
            btnTextStyle: blackText14,
            btnText: strAddPhoto,
            onTap: () {
              if (isPhotoEditingDoneForProfile && isPhotoEditingDoneForCard) {
                Navigator.pop(context, {
                  'ImageFileName': widget.userProfileModel.imageFileName,
                });
              }
            },
          ),
          RoundButton(
            btnOpacity: 1,
            bgColor: grey,
            btnTextStyle: greyText13,
            btnText: strPreviewPhoto,
            onTap: () async {
              captureWidgetScreenshot(context);
            },
          ),
          RoundButton(
            btnOpacity: 1,
            bgColor: grey,
            btnTextStyle: greyText13,
            btnText: strSelectFromLibrary,
            onTap: () async {
              widget.userProfileModel =
                  await Utils().pickImage(widget.userProfileModel);
              isPhotoEditingDoneForProfile = false;
              isPhotoEditingDoneForCard = false;
              profilePhotoViewController = PhotoViewController();
              cardPhotoViewController = PhotoViewController();


              setState(() {});
            },
          ),
          RoundButton(
            btnOpacity: 0.5,
            bgColor: grey,
            btnTextStyle: whiteText14,
            btnText: strCancel.toUpperCase(),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSwipeButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2),
      decoration: outlineGreyBorderAndBg,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              highlightColor: black.withOpacity(0.95),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              onTap: () {
                showCardView = false;
                setState(() {});
              },
              child: Container(
                height: 35,
                decoration: showCardView ? bgRectGrey : blackBg,
                child: Row(
                  children: [
                    const Spacer(),
                    Text(
                      strProfile,
                      style: greyText12,
                    ),
                    const Spacer(),
                    _buildDot(isPhotoEditingDoneForProfile ? pink : grey)
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              highlightColor: black.withOpacity(0.95),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              onTap: () {
                showCardView = true;
                setState(() {});
              },
              child: Container(
                height: 35,
                decoration: showCardView ? blackBg : bgRectGrey,
                child: Row(
                  children: [
                    const Spacer(),
                    Text(
                      strCard,
                      style: greyText12,
                    ),
                    const Spacer(),
                    _buildDot(isPhotoEditingDoneForCard ? pink : grey)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 4.0,
      height: 4.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  Future<void> captureWidgetScreenshot(BuildContext context) async {
    RenderRepaintBoundary boundary;
    if (showCardView) {
      boundary = repaintKeyForCard.currentContext!.findRenderObject()
          as RenderRepaintBoundary;
    } else {
      boundary = repaintKey.currentContext!.findRenderObject()
          as RenderRepaintBoundary;
    }

    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData != null) {
      _imageBytes = byteData.buffer.asUint8List();
      _navigateToProfilePreviewScreen(context);
    }
  }

  Color _getButtonColor() {
    if (isPhotoEditingDoneForProfile && showCardView == false) {
      return pink;
    }
    if (isPhotoEditingDoneForCard && showCardView) {
      return pink;
    }
    return grey;
  }
}
