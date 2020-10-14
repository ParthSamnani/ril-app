//import 'dart:io';
//
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:flutter/material.dart';
//
//class Uploader extends StatefulWidget {
//  final File file;
//
//  Uploader({this.file});
//
//  @override
//  _UploaderState createState() => _UploaderState();
//}
//
//class _UploaderState extends State<Uploader> {
//  final FirebaseStorage _storage = FirebaseStorage(storageBucket: 'gs://ril-app-bb543.appspot.com/');
//  StorageUploadTask _uploadTask;
//
//  void _startUpload() {
//    String filePath = 'images/${DateTime.now()}.png';
//
//    setState(() {
//      _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    if (widget.file != null) {
//      _startUpload();
//      return StreamBuilder<StorageTaskEvent>(
//        stream: _uploadTask.events,
//        builder: (context, snapshot) {
//          var event = snapshot?.data?.snapshot;
//          double progressPercent = event != null ? event.bytesTransferred / event.totalByteCount : 0;
//          return Column(
//            children: [
//              if (_uploadTask.isComplete) Text('Done'),
//              LinearProgressIndicator(
//                value: progressPercent,
//              ),
//              Text('${(progressPercent * 100).toStringAsFixed(2)} % '),
//            ],
//          );
//        },
//      );
//    } else {
//      return Container();
//    }
//  }
//}
