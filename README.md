# Flutter Markdown
[![Build Status](https://travis-ci.org/flutter/flutter_markdown.svg?branch=master)](https://travis-ci.org/flutter/flutter_markdown)

This is an application specific implementation of Flutter Markdown library only designed for Hypertension Care App by Hypertension UG.

A markdown renderer for Flutter. It supports the
[original format](https://daringfireball.net/projects/markdown/), but no inline
html.

## Getting Started
Pass the article number inside the url parameter of the markdown body.

The articles data should be in the following and all the keys are mandatory.



```
  {
    "img": "assets/lib/articles/1_0.svg",
    "title": "Welcome",
    "content": "null.",
    "rank": "999",
    "chapter": "1.0"
  },
```
