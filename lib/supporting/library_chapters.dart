import 'package:flutter/material.dart';
import 'package:flutter_markdown/supporting/articles.dart';
import 'package:flutter_markdown/supporting/articlesEN.dart';
import 'package:flutter_markdown/supporting/read_articles.dart';
import 'package:Hypertonie_v2/controllers/system/size.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:Hypertonie_v2/views/widgets/common_widgets/typography.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Hypertonie_v2/controllers/library/library_main_controller.dart';

class LibraryChapters extends StatefulWidget {
  LibraryChapters(
      {Key key,
      @required this.chapter,
      @required this.language,
      @required this.title,
      @required this.list})
      : super(key: key);

  final chapter;
  final title;
  final list;
  final language;

  @override
  _LibraryChaptersState createState() => _LibraryChaptersState();
}

class _LibraryChaptersState extends State<LibraryChapters> {
  final FocusNode searchField = FocusNode();
  TextEditingController controller = new TextEditingController();

  var art = [];
  var artEN = [];
  @override
  void initState() {
    for (int i = 0; i < widget.list.length; i++) {
      art.add(articles[widget.list[i]]);
      artEN.add(articles[widget.list[i]]);
    }
    if (widget.language == 'de') {
      for (Map user in art) {
        articleDetails.add(ArticleDetails.fromJson(user));
      }
      articleDetails.removeAt(0);
    } else {
      for (Map user in artEN) {
        articleDetails.add(ArticleDetails.fromJson(user));
      }
      articleDetails.removeAt(0);
    }
    super.initState();
  }

  List<ArticleDetails> _searchResult = [];

  List<ArticleDetails> articleDetails = [];

  onSearchTextChanged(String text) async {
    if (stateController.search.value == false) {
      stateController.searchToggle();
    }
    _searchResult.clear();

    if (text.isEmpty) {
      setState(() {});
      return;
    }
    print(text.toLowerCase());

    articleDetails.forEach((articleDetail) {
      if ((articleDetail.content.toLowerCase().contains(text.toLowerCase())) ||
          (articleDetail.title.toLowerCase().contains(text.toLowerCase()))) {
        _searchResult.add(articleDetail);
      }
    });

    setState(() {});
    print(_searchResult[0].title);
  }

  SearchBar searchBar;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
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
            text: '${'libraryChapterTab'.tr} ${widget.chapter}',
            fontSize: 17,
          ),
          searchBar.getSearchAction(context)
        ],
      ),
      automaticallyImplyLeading: false,
    );
  }

  _LibraryChaptersState() {
    searchBar = new SearchBar(
        inBar: false,
        clearOnSubmit: false,
        closeOnSubmit: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onChanged: onSearchTextChanged,
        controller: controller,
        showClearButton: true,
        onClosed: () {
          if (stateController.search.value == true) {
            stateController.searchToggle();
          }
          print("closed");
        });
  }
  final LibraryControllerMain stateController =
      Get.put(LibraryControllerMain());
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: searchBar.build(context),
      key: _scaffoldKey,
      /*   appBar: AppBar(
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
              text: '${'Chapter'.tr}: ${widget.chapter}',
              fontSize: 17,
            ),
            GestureDetector(
                onTap: () async {
                  controller.clear();
                  onSearchTextChanged('');
                },
                child: Icon(Icons.search)),
          ],
        ),
        automaticallyImplyLeading: false,
      ), */
      body: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
          child: controller.text.length == 0
              ? Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey)),
                  child: ListView.builder(
                    padding: EdgeInsets.all(4),
                    primary: false,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: articles == null ? 0 : widget.list.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map article;
                      if (widget.language == 'en') {
                        article = articlesEN[widget.list[index]];
                      } else if (widget.language == 'de') {
                        article = articles[widget.list[index]];
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  var date =
                                      await ReadDate.getDate(article['rank']);
                                  print(date);

                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return OnClickLibrary(
                                            chapter: widget.chapter,
                                            language: widget.language,
                                            rank: article['rank'],
                                            title: article["title"],
                                            image: article["img"],
                                            date: date,
                                            content: article["content"],
                                            block: article["block"]);
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 64,
                                  decoration: BoxDecoration(
                                    border: index != widget.list.length - 1
                                        ? Border(
                                            bottom: BorderSide(
                                              color: Colors.grey,
                                              width: 0.2,
                                            ),
                                          )
                                        : (null),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 24.0),
                                                child: ListTitleText(
                                                    text:
                                                        '${article["chapter"]}. '),
                                              ),
                                              Container(
                                                  width: 182,
                                                  child: ListTitleText(
                                                      text: article["title"])),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          FontAwesomeIcons.chevronRight,
                                          color: Colors.grey,
                                          size: 14,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: index == 0,
                                  child: Divider(
                                    thickness: 0.2,
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : _searchResult.length == 0
                  ? Container(
                      child: Center(
                        child: SubHeading(text: 'emptySearch'.tr),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey)),
                      child: ListView.builder(
                        padding: EdgeInsets.all(4),
                        primary: false,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: articles == null ? 0 : _searchResult.length,
                        itemBuilder: (BuildContext context, int index) {
                          Map article;
                          if (widget.language == 'en') {
                            article = articlesEN[widget.list[index]];
                          } else if (widget.language == 'de') {
                            article = articles[widget.list[index]];
                          }
                          Map art = {
                            'title': _searchResult[index].title,
                            'chapter': _searchResult[index].chapter,
                            'img': _searchResult[index].img,
                            'rank': _searchResult[index].id,
                            'content': _searchResult[index].content,
                            'block': _searchResult[index].block,
                          };

                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: GestureDetector(
                                      onTap: () async {
                                        var date = await ReadDate.getDate(
                                            article['rank']);
                                        print(date);

                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return OnClickLibrary(
                                                  chapter: widget.chapter,
                                                  language: widget.language,
                                                  rank: art['rank'],
                                                  title: art["title"],
                                                  image: art["img"],
                                                  date: date,
                                                  content: art["content"],
                                                  block: art["block"]);
                                            },
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 64,
                                        decoration: BoxDecoration(
                                          border: index != 0 ||
                                                  index !=
                                                      _searchResult.length - 1
                                              ? Border(
                                                  bottom: BorderSide(
                                                    color: Colors.grey,
                                                    width: 0.2,
                                                  ),
                                                )
                                              : (null),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 16.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  width:
                                                      ScreenSize.convertWidth(
                                                          index == 0
                                                              ? 209
                                                              : 278,
                                                          context),
                                                  child: ListTitleText(
                                                      text:
                                                          '${_searchResult[index].chapter} ${_searchResult[index].title}')),
                                              Icon(
                                                FontAwesomeIcons.chevronRight,
                                                color: Colors.grey,
                                                size: 14,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                      visible: index == 0,
                                      child: Divider(
                                        thickness: 0.2,
                                      )),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )),
    );
  }
}

class ArticleDetails {
  final String id, title, img, content, block, chapter;

  ArticleDetails(
      {this.id, this.title, this.img, this.content, this.block, this.chapter});

  factory ArticleDetails.fromJson(Map<String, dynamic> json) {
    return new ArticleDetails(
      id: json['rank'],
      chapter: json['chapter'],
      title: json['title'],
      img: json['img'],
      content: json['content'],
      block: json['block'],
    );
  }
}
