import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/svg.dart';

class OnClickLibrary extends StatefulWidget {
  final String title;
  final String image;
  final String content;
  final String uId;
  final String block;
  final String language;

  OnClickLibrary(
      {Key key,
      @required this.title,
      @required this.language,
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
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios)),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 20.0),
                overflow: TextOverflow.ellipsis,
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
                      onTap: () {
                        Navigator.of(context).maybePop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7.0),
                          ),
                          color: Colors.green,
                          border: Border.all(
                              width: 3,
                              color: Colors.green,
                              style: BorderStyle.solid),
                        ),
                        child: Center(
                            child: Text(
                          doneButton,
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
