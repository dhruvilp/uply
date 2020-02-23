import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uply/ui/pages/job_suggestions.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';


class WidgetProjectionPage extends StatefulWidget {
  @override
  _WidgetProjectionPageState createState() => _WidgetProjectionPageState();
}

class _WidgetProjectionPageState extends State<WidgetProjectionPage> {
  ArCoreController arCoreController;
  Map<int, ArCoreAugmentedImage> augmentedImagesMap = Map();
  String anchorId;
  double x, y;
  double width = 1, height = 1;
  Matrix4 transform = Matrix4.identity();

  @override
  void dispose() {
    arCoreController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Job Openings', style: Theme.of(context).textTheme.title,),
        brightness: Brightness.light,
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ArCoreView(
            onArCoreViewCreated: _onArCoreViewCreated,
            type: ArCoreViewType.AUGMENTEDIMAGES,
          ),
          Positioned(
            left: x,
            top: y,
            child: Container(
              transform: transform,
              width: width,
              height: height,
              child: JobSuggestions(),
            ),
          ),
        ],
      ));

  loadSingleImage() async {
    final ByteData bytes =
    await rootBundle.load('assets/anchor_board.png');
    arCoreController.loadSingleAugmentedImage(
        bytes: bytes.buffer.asUint8List());
  }

  void _onArCoreViewCreated(ArCoreController controller) async {
    arCoreController = controller;
    arCoreController.onTrackingImage = _handleOnTrackingImage;
    loadSingleImage();
  }

  _handleOnTrackingImage(ArCoreAugmentedImage augmentedImage) {
    if (!augmentedImagesMap.containsKey(augmentedImage.index)) {
      augmentedImagesMap[augmentedImage.index] = augmentedImage;
    }
    setState(() {
      x = augmentedImage.centerPose.rotation[0] * 45;    // left
      y = augmentedImage.centerPose.rotation[3] * 50;    // top
      width = augmentedImage.extentZ * 2500;
      height = augmentedImage.extentZ * 3500;
    });
  }

}