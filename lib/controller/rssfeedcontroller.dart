import 'package:flutter/foundation.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;

class RssFeedController extends ChangeNotifier {
  RssFeed? _feed;
  // ignore: constant_identifier_names
  static const String FEED_URL =
      'https://www.antaranews.com/rss/warta-bumi.xml';

  RssFeed? get feed => _feed;

  Future<void> loadFeed() async {
    try {
      final client = http.Client();
      final response = await client
          .get(Uri.parse(FEED_URL)); // Menggunakan feedUrl dari controller
      final feed = RssFeed.parse(response.body);
      _feed = feed;
      notifyListeners(); // Memberi tahu listener bahwa data telah berubah
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  isFeedEmpty() {
    return null == _feed || null == _feed!.items;
  }
}
