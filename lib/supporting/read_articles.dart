import 'package:flutter/material.dart';
import 'package:flutter_markdown/supporting/library_chapters.dart';
import 'package:flutter_markdown/supporting/supporting.dart';
import 'package:intl/intl.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hypertonie_v_3/views/widgets/common_widgets/typography.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnClickLibrary extends StatefulWidget {
  final String title;
  final String rank;
  final String image;
  final String content;
  final String uId;
  final String block;
  final String language;
  final int date;
  final chapter;

  OnClickLibrary(
      {Key key,
      @required this.title,
      @required this.language,
      @required this.rank,
      @required this.chapter,
      this.date,
      this.image,
      this.content,
      this.uId,
      this.block})
      : super(key: key);
  @override
  _OnClickLibraryState createState() => _OnClickLibraryState();
}

class _OnClickLibraryState extends State<OnClickLibrary> {
  var top = 0.0;
  bool showTitle = true;

  @override
  void initState() {
    if (widget.language == 'en') {
      setState(() {
        doneButton = 'Read';
      });
    } else {
      setState(() {
        doneButton = 'Gelesen';
      });
    }
    super.initState();
  }

  String doneButton = 'Gelesen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: RegularText(
                text: 'backButton'.tr,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Heading(
              text: 'libraryTitle'.tr,
              fontSize: 17,
            ),
            GestureDetector(
              onTap: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return LibraryChapters(
                        language: widget.language,
                        chapter: widget.chapter,
                        title: widget.title,
                        list: (widget.chapter == '1')
                            ? LibrarySupporting.chapter1
                            : (widget.chapter == '2')
                                ? LibrarySupporting.chapter2
                                : (widget.chapter == '3')
                                    ? LibrarySupporting.chapter3
                                    : (widget.chapter == '4')
                                        ? LibrarySupporting.chapter4
                                        : (widget.chapter == '5')
                                            ? LibrarySupporting.chapter5
                                            : (widget.chapter == '6')
                                                ? LibrarySupporting.chapter6
                                                : (widget.chapter == '7')
                                                    ? LibrarySupporting.chapter7
                                                    : (widget.chapter == '8')
                                                        ? LibrarySupporting
                                                            .chapter8
                                                        : (widget.chapter ==
                                                                '9')
                                                            ? LibrarySupporting
                                                                .chapter9
                                                            : (widget.chapter ==
                                                                    '10')
                                                                ? LibrarySupporting
                                                                    .chapter10
                                                                : (widget.chapter ==
                                                                        '11')
                                                                    ? LibrarySupporting
                                                                        .chapter11
                                                                    : (widget.chapter ==
                                                                            '12')
                                                                        ? LibrarySupporting
                                                                            .chapter12
                                                                        : (widget.chapter ==
                                                                                '13')
                                                                            ? LibrarySupporting.chapter13
                                                                            : (widget.chapter == '14')
                                                                                ? LibrarySupporting.chapter14
                                                                                : (widget.chapter == '15')
                                                                                    ? LibrarySupporting.chapter15
                                                                                    : (widget.chapter == '16')
                                                                                        ? LibrarySupporting.chapter16
                                                                                        : (widget.chapter == '17')
                                                                                            ? LibrarySupporting.chapter17
                                                                                            : [],
                      );
                    },
                  ),
                );
              },
              child: RegularText(
                text: 'libraryChapterTab'.tr,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        buildMarkDown(context, widget.language),
                        SizedBox(height: 80.0),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
                  child: Container(
                    height: 50,
                    child: GestureDetector(
                      onTap: () async {
                        if (widget.date == 0) {
                          await ReadDate.setDate(widget.rank);
                        }

                        Navigator.of(context).maybePop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7.0),
                          ),
                          color: widget.date == 0
                              ? Theme.of(context).primaryColor
                              : Colors.green,
                          border: Border.all(
                              width: 3,
                              color: widget.date == 0
                                  ? Theme.of(context).primaryColor
                                  : Colors.green,
                              style: BorderStyle.solid),
                        ),
                        child: Center(
                            child: Text(
                          widget.date == 0
                              ? doneButton
                              : '${'readTextOnDateButton'.tr}${DateFormat('dd. MMM yyyy', widget.language == 'de' ? 'de_DE' : 'en_EN').format(new DateTime.fromMillisecondsSinceEpoch(widget.date))}',
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.width / (375 / 14),
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'interRegular',
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7.0),
                    ),
                    color: Colors.white,
                    border: Border.all(
                        width: 3,
                        color: Colors.white,
                        style: BorderStyle.solid)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildMarkDown(BuildContext context, language) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            widget.image,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / (812 / 226),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / (375 / 24),
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontFamily: 'interRegular',
              ),
            ),
          ),
          Visibility(
            visible: (widget.block.isNotEmpty),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, top: 8.0, bottom: 8.0, right: 8.0),
                child: MarkdownBody(
                  language: language,
                  data: widget.block,
                  chapter: widget.chapter,
                  styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
                      .copyWith(
                          p: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontSize: MediaQuery.of(context).size.width /
                                  (375 / 16),
                              height: 1.5)),
                ),
              ),
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(stops: [
                    0.02,
                    0.02
                  ], colors: [
                    Colors.yellow.shade700,
                    Colors.yellow.withOpacity(0.1)
                  ]),
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(6.0))),
            ),
          ),
          Visibility(
            visible: (widget.block.isNotEmpty),
            child: SizedBox(
              height: MediaQuery.of(context).size.width / (375 / 8),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: MarkdownBody(
              language: language,
              data: widget.content,
              chapter: widget.chapter,
              styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
                  .copyWith(
                      p: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontSize:
                              MediaQuery.of(context).size.width / (375 / 16),
                          height: 1.5)),
            ),
          ),
        ],
      ),
    );
  }
}

class ReadDate {
  static Future setDate(article) async {
    var now = new DateTime.now();
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(article, now.millisecondsSinceEpoch);
  }

  static Future getDate(article) async {
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getInt(article));
    return prefs.getInt(article) ?? 0;
  }
}
