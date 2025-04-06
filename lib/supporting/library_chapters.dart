import 'package:flutter/material.dart';
import 'package:flutter_markdown/supporting/articles.dart';
import 'package:flutter_markdown/supporting/articlesEN.dart';
import 'package:flutter_markdown/supporting/read_articles.dart';
import 'package:hypertonie_v_3/controllers/system/size.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hypertonie_v_3/views/widgets/common_widgets/typography.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hypertonie_v_3/controllers/library/library_main_controller.dart';

class LibraryChapters extends StatefulWidget {
  final dynamic chapter;
  final dynamic title;
  final dynamic list;
  final dynamic language;

  const LibraryChapters(
      {super.key,
      required this.chapter,
      required this.language,
      required this.title,
      required this.list});

  @override
  State<LibraryChapters> createState() => _LibraryChaptersState();
}

class _LibraryChaptersState extends State<LibraryChapters> {
  final FocusNode searchField = FocusNode();
  final TextEditingController controller = TextEditingController();
  final LibraryControllerMain stateController =
      Get.put(LibraryControllerMain());

  List<ArticleDetails> articleDetails = [];
  List<ArticleDetails> _searchResult = [];

  @override
  void initState() {
    super.initState();
    final art = widget.list.map((id) => articles[id]).toList();
    final artEN = widget.list.map((id) => articlesEN[id]).toList();
    final source = widget.language == 'de' ? art : artEN;
    articleDetails =
        source.map((json) => ArticleDetails.fromJson(json)).toList();
    if (articleDetails.isNotEmpty) {
      articleDetails.removeAt(0);
    }
  }

  void onSearchTextChanged(String text) {
    if (!stateController.search.value) {
      stateController.searchToggle();
    }
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    _searchResult.addAll(articleDetails.where((article) =>
        article.content.toLowerCase().contains(text.toLowerCase()) ||
        article.title.toLowerCase().contains(text.toLowerCase())));
    setState(() {});
  }

  @override
  void dispose() {
    Get.delete<LibraryControllerMain>();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: ArticleSearchDelegate(
                    allArticles: articleDetails,
                    onSelect: (article) async {
                      var date = await ReadDate.getDate(article.id);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OnClickLibrary(
                          chapter: widget.chapter,
                          language: widget.language,
                          rank: article.id,
                          title: article.title,
                          image: article.img,
                          date: date,
                          content: article.content,
                          block: article.block,
                        ),
                      ));
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: _buildArticleList(articleDetails),
      ),
    );
  }

  Widget _buildArticleList(List<ArticleDetails> articles) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return GestureDetector(
          onTap: () async {
            var date = await ReadDate.getDate(article.id);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => OnClickLibrary(
                chapter: widget.chapter,
                language: widget.language,
                rank: article.id,
                title: article.title,
                image: article.img,
                date: date,
                content: article.content,
                block: article.block,
              ),
            ));
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300, width: 0.5),
              ),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 24, right: 16),
              title:
                  ListTitleText(text: '${article.chapter}. ${article.title}'),
              trailing: const Icon(FontAwesomeIcons.chevronRight,
                  color: Colors.grey, size: 14),
            ),
          ),
        );
      },
    );
  }
}

class ArticleSearchDelegate extends SearchDelegate<ArticleDetails?> {
  final List<ArticleDetails> allArticles;
  final Function(ArticleDetails) onSelect;

  ArticleSearchDelegate({required this.allArticles, required this.onSelect});

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => query = '',
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) => buildSuggestions(context);

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = allArticles
        .where((article) =>
            article.title.toLowerCase().contains(query.toLowerCase()) ||
            article.content.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final article = results[index];
        return ListTile(
          title: Text('${article.chapter}. ${article.title}'),
          trailing: const Icon(FontAwesomeIcons.chevronRight,
              size: 14, color: Colors.grey),
          onTap: () {
            onSelect(article);
            close(context, article);
          },
        );
      },
    );
  }
}

class ArticleDetails {
  final String id, title, img, content, block, chapter;

  ArticleDetails({
    required this.id,
    required this.title,
    required this.img,
    required this.content,
    required this.block,
    required this.chapter,
  });

  factory ArticleDetails.fromJson(Map<String, dynamic> json) {
    return ArticleDetails(
      id: json['rank'],
      chapter: json['chapter'],
      title: json['title'],
      img: json['img'],
      content: json['content'],
      block: json['block'],
    );
  }
}
