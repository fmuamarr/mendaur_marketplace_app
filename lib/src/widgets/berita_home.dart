import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mendaur_pilot_app/src/screens/berita_page/berita_read_detail.dart';

class BeritaHomeCard extends StatelessWidget {
  const BeritaHomeCard({
    Key? key,
    required List posts,
  })  : _posts = posts,
        super(key: key);

  final List _posts;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          _posts.length,
          (index) => GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (c) => BeritaReadDetail(
                            url: _posts[index]['url'],
                            title: _posts[index]['title'],
                            content: _posts[index]['content'],
                            publisedAt: _posts[index]['publishedAt'],
                            author: _posts[index]['author'],
                            urlToImage: _posts[index]['urlToImage'],
                          )));
            },
            child: Card(
              elevation: 2, // Atur tinggi bayangan sesuai kebutuhan
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Colors.white,
                ),
              ),
              child: Container(
                height: 170,
                width: 130,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 85,
                        width: 125,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: _posts[index]['urlToImage'] != null
                              ? Image.network(
                                  _posts[index]['urlToImage'],
                                )
                              : Image.asset(
                                  'assets/images/bazar_cek.png',
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        '${_posts[index]['title']}',
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
                        'Sumber: ${_posts[index]['url']}',
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
          ),
        ),
      ),
    );
  }
}
