import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension WidgetExtension on Widget {
  Widget onTap(void onTap()) {
    return InkWell(
      child: this,
      onTap: onTap,
    );
  }

  Widget background(Color color) {
    return ColoredBox(
      color: color,
      child: this,
    );
  }

  Widget size({double? width, double? height}) {
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }

  Widget center() {
    return Center(
      child: this,
    );
  }

  WidgetExtensionModel toTap(void onTap()) {
    var m = WidgetExtensionModel();
    m.child = this;
    m.onTap = onTap;
    return m;
  }

  WidgetExtensionModel toBg(Color c) {
    var m = WidgetExtensionModel();
    m.child = this;
    m.backgroundColor = c;
    return m;
  }

  WidgetExtensionModel toSize({double? w, double? h}) {
    var m = WidgetExtensionModel();
    m.child = this;
    m.width = w;
    m.height = h;
    return m;
  }

  WidgetExtensionModel toCenter() {
    var m = WidgetExtensionModel();
    m.child = this;
    m.isCenter = true;
    return m;
  }

  WidgetExtensionModel toPd({double? l, double? r, double? t, double? b}) {
    var m = WidgetExtensionModel();
    m.child = this;
    m.paddingLeft = l;
    m.paddingRight = r;
    m.paddingTop = t;
    m.paddingBottom = b;
    return m;
  }

  WidgetExtensionModel toPdAll(double p) {
    var m = WidgetExtensionModel();
    m.child = this;
    m.paddingLeft = p;
    m.paddingRight = p;
    m.paddingTop = p;
    m.paddingBottom = p;
    return m;
  }

  WidgetExtensionModel toPdBoth({double? lr, double? tb}) {
    var m = WidgetExtensionModel();
    m.child = this;
    m.paddingLeft = lr;
    m.paddingRight = lr;
    m.paddingTop = tb;
    m.paddingBottom = tb;
    return m;
  }
}

extension WidgetsExtension on WidgetExtensionModel {
  WidgetExtensionModel toTap(void onTap()) {
    this.onTap = onTap;
    return this;
  }

  WidgetExtensionModel toBg(Color c) {
    this.backgroundColor = c;
    return this;
  }

  WidgetExtensionModel toSize({double? w, double? h}) {
    this.width = w;
    this.height = h;
    return this;
  }

  WidgetExtensionModel toCenter() {
    this.isCenter = true;
    return this;
  }

  WidgetExtensionModel toPd({double? l, double? r, double? t, double? b}) {
    this.paddingLeft = l;
    this.paddingRight = r;
    this.paddingTop = t;
    this.paddingBottom = b;
    return this;
  }

  WidgetExtensionModel toPdAll(double p) {
    this.paddingLeft = p;
    this.paddingRight = p;
    this.paddingTop = p;
    this.paddingBottom = p;
    return this;
  }

  WidgetExtensionModel toPdBoth({double? lr, double? tb}) {
    this.paddingLeft = lr;
    this.paddingRight = lr;
    this.paddingTop = tb;
    this.paddingBottom = tb;
    return this;
  }

  Widget toWidget() {
    var c = child;
    if (c == null) {
      return Center(
        child: Text('child is empty'),
      );
    }
    if (_defaultModel == this) {
      return Center(
        child: Text('air widget extension is empty'),
      );
    }

    Widget current = c;

    if (isCenter ?? false) {
      current = Center(
        child: current,
      );
    }

    if (backgroundColor != null) {
      current = ColoredBox(color: backgroundColor!, child: current);
    }

    if (height != null || width != null) {
      current = ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: width, height: height),
          child: current);
    }

    if (_isPadding()) {
      current = Padding(
          padding: EdgeInsets.only(
              left: paddingLeft ?? 0,
              right: paddingRight ?? 0,
              top: paddingTop ?? 0,
              bottom: paddingBottom ?? 0),
          child: current);
    }

    if (onTap != null) {
      current = InkWell(
        child: current,
        onTap: onTap,
      );
    }
    return current;
  }
}

WidgetExtensionModel _defaultModel = WidgetExtensionModel();

class WidgetExtensionModel {
  double? width;
  double? height;
  double? paddingLeft;
  double? paddingRight;
  double? paddingTop;
  double? paddingBottom;
  bool? isCenter;
  Color? backgroundColor;
  VoidCallback? onTap;
  Widget? child;

  bool _isPadding() =>
      paddingLeft != null ||
      paddingRight != null ||
      paddingTop != null ||
      paddingBottom != null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WidgetExtensionModel &&
          runtimeType == other.runtimeType &&
          width == other.width &&
          height == other.height &&
          paddingLeft == other.paddingLeft &&
          paddingRight == other.paddingRight &&
          paddingTop == other.paddingTop &&
          paddingBottom == other.paddingBottom &&
          isCenter == other.isCenter &&
          backgroundColor == other.backgroundColor &&
          onTap == other.onTap &&
          child == other.child;

  @override
  int get hashCode =>
      width.hashCode ^
      height.hashCode ^
      paddingLeft.hashCode ^
      paddingRight.hashCode ^
      paddingTop.hashCode ^
      paddingBottom.hashCode ^
      isCenter.hashCode ^
      backgroundColor.hashCode ^
      child.hashCode ^
      onTap.hashCode;
}