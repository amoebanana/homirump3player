import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:homirump3player/consts/colors.dart';
import 'package:homirump3player/consts/textstyle.dart';
import 'package:homirump3player/controllers/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Home", style: ourStyle(family: "bold")),
          backgroundColor: bgColor,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: whiteColor)),
          ],
        ),
        body: FutureBuilder<List<SongModel>>(
            future: OnAudioQuery().querySongs(
              ignoreCase: true,
              orderType: OrderType.ASC_OR_SMALLER,
              sortType: null,
              path: "/storage/emulated/0/hdir",
            ),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              else if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text("No music found"),
                );
              }
              else
              {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 3),
                          child: ListTile(
                            // visualDensity: VisualDensity(horizontal: -4, vertical: VisualDensity.minimumDensity),
                            // contentPadding: const EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            tileColor: Colors.grey[800],
                            title: Text(
                              snapshot.data![index].title,
                              style: ourStyle(family: "bold", size: 16),
                            ),
                            subtitle: Text(
                              snapshot.data![index].artist ?? "Unknown",
                              style: ourStyle(size: 14),
                            ),
                            leading: QueryArtworkWidget(
                              id: snapshot.data![index].id,
                              type: ArtworkType.AUDIO,
                              artworkBorder: BorderRadius.circular(2),
                              artworkWidth: 50,
                            ),
                            trailing: const Icon(
                              Icons.play_arrow,
                              color: whiteColor,
                              size: 32,
                            ),
                            onTap: () {
                              controller.playSong(snapshot.data![index].uri, index);
                            },
                          ),
                        );
                      }),
                );
              }
            }));
  }
}
