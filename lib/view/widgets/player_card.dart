import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menaitechtask/helper/helper.dart';
import 'package:menaitechtask/model/player.dart';

class PlayerCard extends StatelessWidget {
  final Player player;

  const PlayerCard({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed('/player', arguments: player);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Helper.getColorByPosition(player.position),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: player.id.toString(),
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
                          height: 70,
                          width: 70,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 2, right: 2, top: 3),
                            child: Text(
                              "${player.firstName} ${player.lastName}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 2, right: 2, top: 3),
                            child: Text(
                              player.team.fullName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.blueGrey.shade100,
            thickness: 0.5,
          ),
        ],
      ),
    );
  }

}
