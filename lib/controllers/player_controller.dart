import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController {
  PlayerController() : super();
  final audioPlayer = AudioPlayer();
  late int playindex;

  @override
  void onInit() {
    super.onInit();
    // checkPermission();
  }

  playSong(String? uri, int index) {
    playindex = index;
    try {
      audioPlayer.setAudioSource(
        AudioSource.uri(Uri.parse(uri!)),
      );
      audioPlayer.play();
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  checkPermission() async {
    var perm = await Permission.storage.request();
    if (perm.isGranted) {
    } else {
      checkPermission();
    }
  }

  static isFirstTime({required BuildContext context}) async {
    bool perm = await getPermission();
    Timer(const Duration(milliseconds: 1500), () async {
      if (perm) {
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        await openAppSettings();
      }
    });
  }

  static Future<bool> getPermission() async {
    var perm = await Permission.audio.status;
    if (perm.isGranted) {
      return true;
    } else {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
        Permission.manageExternalStorage,
        Permission.mediaLibrary,
        Permission.audio,
      ].request();
      var temp = await Permission.audio.status;
      if (temp.isGranted) {
        return true;
      } else {
        return false;
      }
    }
  }
}
