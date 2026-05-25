import 'dart:ui';

import 'package:flutter/material.dart';

class ListStyle extends ThemeExtension<ListStyle> {
  const ListStyle({
    this.itemBorderRadius = BorderRadiusGeometry.zero,
    this.horizontalGap = 0,
    this.verticalGap = 0,
  });

  final BorderRadiusGeometry itemBorderRadius;

  final double horizontalGap;

  final double verticalGap;

  @override
  ThemeExtension<ListStyle> copyWith({
    BorderRadiusGeometry? itemBorderRadius,
    double? horizontalGap,
    double? verticalGap,
  }) =>
      ListStyle(
        itemBorderRadius: itemBorderRadius ?? this.itemBorderRadius,
        horizontalGap: horizontalGap ?? this.horizontalGap,
        verticalGap: verticalGap ?? this.verticalGap,
      );

  @override
  ThemeExtension<ListStyle> lerp(
    covariant ThemeExtension<ListStyle>? other,
    double t,
  ) {
    if (other is! ListStyle) {
      return this;
    }

    return ListStyle(
      itemBorderRadius: BorderRadiusGeometry.lerp(
        itemBorderRadius,
        other.itemBorderRadius,
        t,
      )!,
      horizontalGap: lerpDouble(
        horizontalGap,
        other.horizontalGap,
        t,
      )!,
      verticalGap: lerpDouble(
        verticalGap,
        other.verticalGap,
        t,
      )!,
    );
  }
}
