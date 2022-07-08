// import 'dart:io';
//
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:my_blue_steth/screens/dashboard/profile/widgets/audio_bubble.dart';
//
// import '../../chat/chat_controller.dart';
//
// class MessageBubble extends StatefulWidget {
//   final String url;
//   final bool isDoctor;
//
//   const MessageBubble({
//     Key? key,
//     required this.url,
//     required this.isDoctor,
//   }) : super(key: key);
//
//   @override
//   State<MessageBubble> createState() => _MessageBubbleState();
// }
//
// class _MessageBubbleState extends State<MessageBubble> {
//   bool isPlaying = false;
//   late String recordFilePath;
//
//   Future<void> play() async {
//     if (recordFilePath != null && File(recordFilePath).existsSync()) {
//       AudioPlayer audioPlayer = AudioPlayer();
//       await audioPlayer.play(
//         recordFilePath,
//         isLocal: true,
//       );
//       setState(() {
//         isPlaying = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ChatController>(builder: (controller) {
//       return Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: AudioBubble(
//           isMe: widget.isDoctor,
//           filepath: widget.url,
//           key: ValueKey(widget.url),
//         ),
//       );
//     });
//   }
// }
