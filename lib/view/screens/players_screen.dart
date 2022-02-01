import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menaitechtask/view/widgets/internet_connection_failed.dart';
import 'package:menaitechtask/view/widgets/loading_player_card.dart';
import 'package:menaitechtask/view/widgets/player_card.dart';
import 'package:menaitechtask/viewmodel/players_page_viewmodel.dart';

class PlayersScreen extends StatelessWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Players'),
        centerTitle: true,
      ),
      body: GetBuilder<PlayerViewModel>(
          init: PlayerViewModel(),
          builder: (controller) {
            if (controller.internetConnection) {
              if (controller.isFirstLoadRunning) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: 11,
                  itemBuilder: (_, index) => const LoadingPlayerCard(),
                );
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16.0),
                        controller: controller.scrollController,
                        itemCount: controller.players.length + 1,
                        itemBuilder: (_, index) =>
                            index == controller.players.length
                                ? (controller.isLoadMoreRunning
                                    ? Column(
                                      children: const [
                                        LoadingPlayerCard(),
                                        LoadingPlayerCard(),
                                      ],
                                    )
                                    : const SizedBox())
                                : PlayerCard(player: controller.players[index]),
                      ),
                    ),
                    // if (controller.isLoadMoreRunning) const LoadingPlayerCard(),
                    if (!controller.hasNextPage)
                      Container(
                        padding: const EdgeInsets.only(top: 30, bottom: 40),
                        color: Colors.amber,
                        child: const Center(
                          child: Text('You have fetched all of the content'),
                        ),
                      ),
                  ],
                );
              }
            }else{
              return const InternetConnectionFailed();
            }
          }),
    );
  }
}
