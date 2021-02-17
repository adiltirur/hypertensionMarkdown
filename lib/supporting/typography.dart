import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({Key key, @required this.text, this.color, this.fontSize})
      : super(key: key);
  final String text;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize ?? 34,
          color: color ?? Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'interBold',
          letterSpacing: 0.37),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.ltr,
    );
  }
}

class SubHeading extends StatelessWidget {
  const SubHeading({Key key, @required this.text, this.color})
      : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 24,
          color: color ?? Theme.of(context).primaryColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'interSemiBold',
          letterSpacing: 0.6),
      maxLines: 2,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.ltr,
    );
  }
}

class Measurments extends StatelessWidget {
  const Measurments({Key key, @required this.text, this.color})
      : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 18,
          color: color ?? Theme.of(context).primaryColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'interSemiBold',
          letterSpacing: 0.22),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.ltr,
    );
  }
}

class SubpageHeading extends StatelessWidget {
  const SubpageHeading({Key key, @required this.text, this.color})
      : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 17,
          color: color ?? Theme.of(context).primaryColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'interSemiBold',
          letterSpacing: -0.41),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.ltr,
    );
  }
}

class RegularTextTitle extends StatelessWidget {
  const RegularTextTitle({Key key, @required this.text, this.color})
      : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 18,
          color: color ?? Theme.of(context).primaryColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'interBold',
          letterSpacing: 0.2),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.ltr,
    );
  }
}

class RegularText extends StatelessWidget {
  const RegularText({Key key, @required this.text, this.color})
      : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16,
          color: color ?? Theme.of(context).primaryColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'interRegular',
          letterSpacing: 0.19),
    );
  }
}

class DateText extends StatelessWidget {
  const DateText({Key key, @required this.text, this.color}) : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 14,
          color: color ?? Theme.of(context).primaryColor,
          fontWeight: FontWeight.w600,
          fontFamily: 'interSemiBold',
          letterSpacing: -0.14),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.ltr,
    );
  }
}

class SecondaryTitle extends StatelessWidget {
  const SecondaryTitle(
      {Key key, @required this.text, this.color, this.maxLines})
      : super(key: key);
  final String text;
  final Color color;
  final maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 14,
          color: color ?? Theme.of(context).primaryColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'interLight',
          letterSpacing: 0.14),
      maxLines: maxLines ?? 3,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.ltr,
    );
  }
}

class ButtonText extends StatelessWidget {
  const ButtonText({Key key, @required this.text, this.color})
      : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 16,
          color: color ?? Theme.of(context).primaryColor,
          fontWeight: FontWeight.w600,
          fontFamily: 'interRegular',
          letterSpacing: 0.16),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.ltr,
    );
  }
}

class AnnotationText extends StatelessWidget {
  const AnnotationText({Key key, @required this.text, this.color})
      : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 12,
          color: color ?? Theme.of(context).primaryColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'interRegular',
          letterSpacing: -0.12),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.ltr,
    );
  }
}

class NavigationText extends StatelessWidget {
  const NavigationText({Key key, @required this.text, this.color})
      : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 12,
          color: color ?? Theme.of(context).primaryColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'interRegular',
          letterSpacing: -0.1),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.ltr,
    );
  }
}

class UnitText extends StatelessWidget {
  const UnitText({Key key, @required this.text, this.color}) : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 11,
          color: color ?? Theme.of(context).primaryColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'interLight',
          letterSpacing: -0.11),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.ltr,
    );
  }
}

class ListTitleText extends StatelessWidget {
  const ListTitleText({Key key, @required this.text, this.color})
      : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16,
          color: color ?? Theme.of(context).primaryColor,
          fontWeight: FontWeight.w400,
          fontFamily: 'interRegular',
          letterSpacing: 0),
      maxLines: 6,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.ltr,
    );
  }
}

class ListText extends StatelessWidget {
  const ListText({Key key, @required this.text, this.color}) : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16,
          color: color ?? Theme.of(context).primaryColor,
          fontWeight: FontWeight.w500,
          fontFamily: 'interMedium',
          letterSpacing: 0.4),
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.ltr,
    );
  }
}
