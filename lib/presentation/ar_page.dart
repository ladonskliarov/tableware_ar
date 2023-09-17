import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ArPage extends StatelessWidget {
  final String model;

  const ArPage({
    required this.model,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios)),
            title: const Text('3D Перегляд')),
        body: ModelViewer(
          backgroundColor: const Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
          src: model,
          ar: true,
          arModes: const ['scene-viewer', 'webxr', 'quick-look'],
          autoRotate: true,
          iosSrc: '',
          disableZoom: true,
        ),
      ),
    );
  }
}