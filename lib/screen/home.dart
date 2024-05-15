import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:homirump3player/consts/colors.dart';
import 'package:homirump3player/consts/textstyle.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 3),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: Colors.grey[800],
                  title: Text(
                    "Music name",
                    style: ourStyle(family: "bold", size: 16),
                  ),
                  subtitle: Text(
                    "Artist name",
                    style: ourStyle(size: 14),
                  ),
                  leading: const Icon(
                    Icons.music_note,
                    color: whiteColor,
                    size: 32,
                  ),
                  trailing: const Icon(
                    Icons.play_arrow,
                    color: whiteColor,
                    size: 32,
                  ),
                ),
              );
            }
            ),
        ));
  }
}
