import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mendaur_pilot_app/controller/rssfeedcontroller.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:mendaur_pilot_app/src/screens/berita_page/berita_read_detail.dart';
import 'package:webfeed/webfeed.dart';

class BeritaHomeCard extends StatefulWidget {
  const BeritaHomeCard({Key? key, required this.controller}) : super(key: key);

  // final RssFeed feed;
  final RssFeedController controller;

  final String title = 'RSS Feed Demo';

  @override
  State<BeritaHomeCard> createState() => _BeritaHomeCardState();
}

class _BeritaHomeCardState extends State<BeritaHomeCard> {
  RssFeed? _feed;
  static const String loadingFeedMsg = 'Loading Feed...';
  static const String feedLoadErrorMsg = 'Error Loading Feed.';
  static const String placeholderImg = 'assets/images/no_image.png';

  RssFeedController get controller => widget.controller;

  // updateTitle(title) {
  //   setState(() {});
  // }

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
    controller.loadFeed().then((result) {
      if (controller.feed == null || controller.feed!.items!.isEmpty) {
        return;
      }
      updateFeed(controller.feed);
    });
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          min(5, _feed?.items?.length ?? 0),
          (index) {
            if (_feed == null ||
                _feed!.items == null ||
                index >= _feed!.items!.length) {
              return const SizedBox(
                child: Text("Berita tidak dapat dimuat"),
              );
            }

            final item = _feed!.items![index];

            return GestureDetector(
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
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                child: SizedBox(
                  height: 170,
                  width: 130,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SizedBox(
                          height: 85,
                          width: 125,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: CachedNetworkImage(
                              placeholder: (context, url) =>
                                  Image.asset(placeholderImg),
                              imageUrl: item.enclosure?.url ?? placeholderImg,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          '${item.title ?? "No title available"}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: GoogleFonts.inter().fontFamily,
                              fontWeight: FontWeight.w700,
                              fontSize: 9),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          'Sumber: ${item.link}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: GoogleFonts.inter().fontFamily,
                              fontWeight: FontWeight.w400,
                              fontSize: 8),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 5),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Lihat Selengkapnya>",
                            style: TextStyle(
                              fontFamily: GoogleFonts.roboto().fontFamily,
                              fontWeight: FontWeight.w700,
                              fontSize: 8,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
