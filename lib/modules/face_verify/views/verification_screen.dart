import 'dart:async';

import 'package:flutter/material.dart';

// Import necessary packages
// import 'package:firebase_ml_vision/firebase_ml_vision.dart';
// import 'package:flutter_camera_ml_vision/flutter_camera_ml_vision.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('data'),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<String> data = [];
//   final _scanKey = GlobalKey<CameraMlVisionState>();
//   BarcodeDetector detector = FirebaseVision.instance.barcodeDetector();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           CameraMlVision<List<Barcode>>(
//             key: _scanKey,
//             detector: detector.detectInImage,
//             resolution: ResolutionPreset.high,
//             onResult: (barcodes) {
//               if (barcodes == null ||
//                   barcodes.isEmpty ||
//                   data.contains(barcodes.first.displayValue) ||
//                   !mounted) {
//                 return;
//               }
//               print('RESULT');
//               // setState(() {
//               //   data.add(barcodes.first.displayValue);
//               // });
//             },
//             onDispose: () {
//               detector.close();
//             },
//           ),
//           Container(
//             alignment: Alignment.bottomCenter,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Expanded(
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(maxHeight: 250),
//                     child: Scrollbar(
//                       child: ListView(
//                         children: data.map((d) {
//                           return Container(
//                             color: Color(0xAAFFFFFF),
//                             child: Padding(
//                               padding: const EdgeInsets.all(16),
//                               child: Text(d),
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     ElevatedButton(
//                       onPressed: () {
//                         _scanKey.currentState!.toggle();
//                       },
//                       child: Text('Start/Pause camera'),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => _SecondScreen()));
//                       },
//                       child: Text('Push new route'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// class _SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: ElevatedButton(
//         onPressed: () {
//           Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => _SecondScreen(),
//           ));
//         },
//         child: Text('Push new route'),
//       ),
//     );
//   }
// }













// // Define a StatefulWidget for your face verification screen
// // class FaceVerificationScreen extends StatefulWidget {
// //   @override
// //   _FaceVerificationScreenState createState() => _FaceVerificationScreenState();
// // }

// // class _FaceVerificationScreenState extends State<FaceVerificationScreen> {
// //   // Initialize variables
// //   bool isFaceDetected = false;
// //   bool isHoldingStill = false;
// //   bool isBrightnessOk = false;

// //   // Method to process the captured image
// //   Future<void> processImage(InputImage image) async {
// //     // Create a face detector
// //     final FaceDetector faceDetector = FirebaseVision.instance.faceDetector();
    
// //     // Detect faces in the image
// //     final List<Face> faces = await faceDetector.processImage(image);

// //     // Check if a face is detected
// //     if (faces.isNotEmpty) {
// //       setState(() {
// //         isFaceDetected = true;
// //       });
      
// //       // Start timer for hold still feature
// //       Timer(Duration(seconds: 5), () {
// //         setState(() {
// //           isHoldingStill = true;
// //         });
// //       });

// //       // Analyze brightness of the image
// //       double brightness = calculateBrightness(image);
// //       if (brightness >= 0.5) {
// //         setState(() {
// //           isBrightnessOk = true;
// //         });
// //       }
// //     }
    
// //     // Dispose the face detector
// //     await faceDetector.close();
// //   }

// //   // Method to calculate brightness of an image
// //   double calculateBrightness(InputImage image) {
// //     // Calculate brightness here
// //     // Return brightness value
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Face Verification'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             // Display instructions and feedback to the user
// //             Text('Please hold still and ensure proper lighting.'),
// //             if (!isFaceDetected)
// //               Text('No face detected.'),
// //             if (isFaceDetected && !isHoldingStill)
// //               Text('Hold still...'),
// //             if (isFaceDetected && isHoldingStill && !isBrightnessOk)
// //               Text('Ensure proper lighting...'),
// //             // Display captured image or camera feed
// //             // Implement camera functionality here
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
