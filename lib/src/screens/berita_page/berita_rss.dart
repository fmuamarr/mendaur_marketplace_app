import 'package:flutter/material.dart';
import 'package:mendaur_pilot_app/controller/rssfeedcontroller.dart';
import 'package:mendaur_pilot_app/src/constants/colors.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

class BeritaRSS extends StatefulWidget {
  final RssFeedController controller;

  BeritaRSS({Key? key, required this.controller}) : super(key: key);

  final String title = 'RSS Feed Demo';

  @override
  BeritaRSSState createState() => BeritaRSSState();
}

class BeritaRSSState extends State<BeritaRSS> {
  //
  // ignore: constant_identifier_names
  // static const String FEED_URL =
  //     'https://www.antaranews.com/rss/warta-bumi.xml';
  RssFeed? _feed;
  String? _title;
  static const String loadingFeedMsg = 'Loading Feed...';
  static const String feedLoadErrorMsg = 'Error Loading Feed.';
  static const String feedOpenErrorMsg = 'Error Opening Feed.';
  static const String placeholderImg = 'assets/images/no_image.png';
  GlobalKey<RefreshIndicatorState>? _refreshKey;

  RssFeedController get controller => widget.controller;

  updateTitle(title) {
    setState(() {
      _title = title;
    });
  }

  updateFeed(feed) {
    setState(() {
      _feed = feed;
    });
  }

  Future<void> openFeed(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  load() async {
    updateTitle(loadingFeedMsg);
    controller.loadFeed().then((result) {
      if (controller.feed == null || controller.feed!.items!.isEmpty) {
        updateTitle(feedLoadErrorMsg);
        return;
      }
      updateFeed(controller.feed);
      updateTitle(controller.feed?.title);
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshKey = GlobalKey<RefreshIndicatorState>();
    updateTitle(widget.title);
    load();
  }

  list() {
    return ListView.builder(
      itemCount: _feed!.items!.length,
      itemBuilder: (BuildContext context, int index) {
        final item = _feed!.items![index];

        final formattedPubDate =
            DateFormat('EEEE, d MMMM y H:mm').format(item.pubDate!);

        return Card(
          elevation: 3, // Tambahkan efek bayangan
          margin: const EdgeInsets.all(8), // Tambahkan margin
          child: InkWell(
            onTap: () {
              item.link != null
                  ? openFeed(item.link!)
                  : showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Error"),
                          content: const Text("Failed to open the link."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CachedNetworkImage(
                  placeholder: (context, url) => Image.asset(placeholderImg),
                  imageUrl: item.enclosure?.url ?? placeholderImg,
                  height: 175,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.title ?? "No title available",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "$formattedPubDate WIB",
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w100,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  body() {
    return controller.isFeedEmpty()
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            key: _refreshKey,
            child: list(),
            onRefresh: () => load(),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        title: Text(
          "Berita Terkini ($_title!)",
          style: const TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context); // Fungsi kembali ke halaman sebelumnya
          },
        ),
      ),
      body: body(),
    );
  }
}
