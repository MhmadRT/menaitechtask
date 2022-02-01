import 'dart:convert';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menaitechtask/model/player.dart';
import 'package:http/http.dart' as http;
import 'package:menaitechtask/network/api_data.dart';

class PlayerViewModel extends GetxController {
  int page = 0;
  int limit = 10;
  bool internetConnection = false;
  bool hasNextPage = true;

  bool isFirstLoadRunning = false;

  bool isLoadMoreRunning = false;

  List<Player> players = [];

  void _firstLoad() async {
    isFirstLoadRunning = true;
    update();
    try {
      final res = await http
          .get(Uri.parse("${ApiData.players}?page=$page&per_page=$limit"));

      players = List<Player>.from(
          json.decode(res.body)["data"].map((x) => Player.fromMap(x)));
      log(res.body);
      update();
    } catch (err) {
      log('Something went wrong ${err.toString()}');
      Get.snackbar('Something went wrong', 'Check your network',
          icon: const Icon(
            Icons.network_check,
            color: Colors.amber,
          ));
    }

    isFirstLoadRunning = false;
    update();
  }

  checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      internetConnection = true;
      update();
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      internetConnection = true;
      update();
    } else {
      internetConnection = false;
      update();
    }
  }

  void _loadMore() async {
    if (hasNextPage == true &&
        isFirstLoadRunning == false &&
        isLoadMoreRunning == false &&
        scrollController.position.extentAfter < 300) {
      isLoadMoreRunning = true;
      update();
      page += 1;
      try {
        final res = await http
            .get(Uri.parse("${ApiData.players}?page=$page&per_page=$limit"));

        final List<Player> fetchedPosts = List<Player>.from(
            json.decode(res.body)["data"].map((x) => Player.fromMap(x)));
        if (fetchedPosts.isNotEmpty) {
          players.addAll(fetchedPosts);
          update();
        } else {
          hasNextPage = false;
          update();
        }
      } catch (err) {
        Get.snackbar('Something went wrong', 'Check your network',
            icon: const Icon(
              Icons.network_check,
              color: Colors.amber,
            ));
      }

      isLoadMoreRunning = false;
      update();
    }
  }

  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    checkConnectivity();
    _firstLoad();
    scrollController = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    scrollController.removeListener(_loadMore);
    super.dispose();
  }
}
