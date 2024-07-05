import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CanvasGuideView extends StatefulWidget {
  const CanvasGuideView({super.key});

  @override
  State<CanvasGuideView> createState() => _CanvasGuideViewState();
}

class _CanvasGuideViewState extends State<CanvasGuideView> {
  ValueNotifier<ui.Image?> imageNotifier = ValueNotifier<ui.Image?>(null);

  getImage() async {
    NetworkImage networkImage = const NetworkImage(
        "https://images.unsplash.com/photo-1497290756760-23ac55edf36f?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
    ImageStream imageStream = networkImage.resolve(ImageConfiguration.empty);
    ImageStreamListener imageStreamListener =
        ImageStreamListener((imageInfo, synchronousCall) {
      imageNotifier.value = imageInfo.image;
    });
    imageStream.addListener(imageStreamListener);
  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _builUI(),
    );
    ;
  }

  Widget _builUI() {
    return Center(
      child: Container(
        color: Colors.grey.shade400,
        child: CustomPaint(
          painter: myPaint(imageInfoNotifier: imageNotifier),
          size: const Size(300, 400),
        ),
      ),
    );
  }
}

class myPaint extends CustomPainter {
  final ValueNotifier<ui.Image?> imageInfoNotifier;
  myPaint({required this.imageInfoNotifier})
      : super(repaint: imageInfoNotifier);



  @override
  void paint(Canvas canvas, Size size) {{
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    ui.Image? image = imageInfoNotifier.value;

    Size imageSize = Size(image!.width.toDouble(),image.height.toDouble());
    Rect imageRect = Offset.zero & imageSize;
    Rect canvasRect = Offset.zero & size;
    
    if(image != null){
canvas.drawImageRect(image, imageRect, canvasRect, paint) ;   }

  }

}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
