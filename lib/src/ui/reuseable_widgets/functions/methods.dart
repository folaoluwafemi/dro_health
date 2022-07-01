import 'package:flutter/material.dart';

SizedBox zeroBox() => const SizedBox(
      height: 0,
      width: 0,
    );
SizedBox boxHeight(double height) => SizedBox(
      height: height,
    );

SizedBox boxWidth(double width) => SizedBox(
      width: width,
    );

SizedBox tinyHeight() => const SizedBox(
      height: 6,
    );

SizedBox tinyWidth() => const SizedBox(
      width: 6,
    );

SizedBox smallHeight() => const SizedBox(
      height: 12,
    );

SizedBox smallWidth() => const SizedBox(
      width: 12,
    );

SizedBox width() => const SizedBox(
      width: 24,
    );

SizedBox height() => const SizedBox(
      height: 24,
    );
