import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        title: Text('Search', style: Theme.of(context).textTheme.title,),
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
              child: const MyHomePage(
                title: 'Widgets in AR',
              ),
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
      x = augmentedImage.centerPose.rotation[0] * 50;    // left
      y = augmentedImage.centerPose.rotation[3] * 50;    // top
      width = augmentedImage.extentZ * 2500;
      height = augmentedImage.extentZ * 3500;
    });
  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() => _counter++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}