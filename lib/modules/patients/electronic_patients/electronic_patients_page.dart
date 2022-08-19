// import 'dart:async';
// import 'dart:math';

// import 'package:avatar_glow/avatar_glow.dart';
// import 'package:flutter/material.dart';
// import 'package:highlight_text/highlight_text.dart';
// import 'package:speech_to_text/speech_recognition_error.dart';
// import 'package:speech_to_text/speech_recognition_result.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;

// class ElectronicPatientsPage extends StatefulWidget {
//   ElectronicPatientsPage({Key? key}) : super(key: key);

//   @override
//   State<ElectronicPatientsPage> createState() => _ElectronicPatientsPageState();
// }

// class _ElectronicPatientsPageState extends State<ElectronicPatientsPage> {
//   final Map<String, HighlightedWord> _highlightedWords = {
//     'flutter': HighlightedWord(
//         onTap: () => print('flutter'),
//         textStyle: TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//         ))
//   };

//   stt.SpeechToText speech = stt.SpeechToText();
//   bool isListening = false;

//   String text = 'Pressione o botão para comecar a falar a evolucao do paciente';

//   double confidence = 1.0;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 100,
//         title: Text('Confiança: ${(confidence * 100.0).toStringAsFixed(1)}%'),
//         centerTitle: true,
//         backgroundColor: Theme.of(context).primaryColor,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(20),
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: AvatarGlow(
//         animate: isListening,
//         glowColor: Theme.of(context).primaryColor,
//         endRadius: 75.0,
//         duration: const Duration(milliseconds: 2000),
//         repeatPauseDuration: const Duration(milliseconds: 100),
//         repeat: true,
//         child: FloatingActionButton(
//           onPressed: listen,
//           child: Icon(isListening ? Icons.mic : Icons.mic_none),
//         ),
//       ),
//       body: SingleChildScrollView(
//         reverse: true,
//         child: Container(
//           child: TextHighlight(
//             text: text,
//             words: _highlightedWords,
//             textStyle: const TextStyle(
//                 fontSize: 32, color: Colors.black, fontWeight: FontWeight.w400),
//           ),
//         ),
//       ),
//     );
//   }

//   void listen() async {
//     if (!isListening) {
//       bool available = await speech.initialize(
//         onStatus: (val) => print('onStatus: $val'),
//         onError: (val) => print('Error: $val'),
//       );
//       if (available) {
//         setState(() => isListening = true);

//         speech.listen(
//           onResult: (val) => setState(() {
//             text = val.recognizedWords;
//             if (val.hasConfidenceRating && val.confidence > 0) {
//               confidence = val.confidence;
//             }
//           }),
//         );
//       } else {
//         setState(() => isListening = false);
//         speech.stop();
//       }
//     }
//   }
// }
