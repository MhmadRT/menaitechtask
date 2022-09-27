import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menaitechtask/helper/helper.dart';
import 'package:menaitechtask/model/player.dart';

class PlayerScreen extends StatelessWidget {
  PlayerScreen({Key? key}) : super(key: key);
  final player = Get.arguments as Player;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Helper.getColorByPosition(player.position),
      appBar: AppBar(
        backgroundColor: Helper.getColorByPosition(player.position),
        title: Text(player.lastName),
        centerTitle: true,
      ),
      body: Center(
        child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Hero(
                    tag: player.id.toString()+player.id.toString(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: player.imageUrl(),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Container(
                                color: Colors.white24,
                                child: const CupertinoActivityIndicator()),
                        errorWidget: (context, url, error) => Container(
                            color: Colors.white24,
                            child: const Icon(Icons.error)),
                        fit: BoxFit.cover,
                        height: 150,
                        width: 150,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 2, right: 2, top: 3),
                      child: Text(
                        "${player.firstName} ${player.lastName}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(left: 2, right: 2, top: 3),
                      child: Text(
                        player.team.fullName,
                        style: const TextStyle(fontWeight: FontWeight.normal),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(left: 2, right: 2, top: 3),
                      child: Text(
                        "Position: ${player.position}",
                        style: const TextStyle(fontWeight: FontWeight.normal),
                      )),
                  if (player.heightInches != null)
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 2, right: 2, top: 3),
                        child: Text(
                          "Height inches:\t${player.heightInches}",
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        )),
                  if (player.heightFeet != null)
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 2, right: 2, top: 3),
                        child: Text(
                          "Height feet:\t${player.heightFeet}",
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        )),
                  if (player.weightPounds != null)
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 2, right: 2, top: 3),
                        child: Text(
                          "Weight Pounds:\t${player.weightPounds}",
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        )),
                ],
              ),
      ),
    );
  }
}
