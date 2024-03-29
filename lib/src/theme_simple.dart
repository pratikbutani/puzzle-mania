// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'core/puzzle_proxy.dart';
import 'flutter.dart';
import 'shared_theme.dart';

const _accentBlue = Color(0xff000579);

class ThemeSimple extends SharedTheme {
  @override
  String get name => 'Simple';

  @override
  String get backgroundAssets => 'asset/theme_simple.jpg';

  const ThemeSimple();

  @override
  Color get puzzleThemeBackground => const Color.fromARGB(210, 90, 135, 170);

  @override
  Color get puzzleBackgroundColor => Colors.white70;

  @override
  Color get puzzleAccentColor => _accentBlue;

  @override
  RoundedRectangleBorder puzzleBorder(bool small) =>
      const RoundedRectangleBorder(
        side: BorderSide(color: Colors.black26, width: 5),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      );

  @override
  Widget tileButton(int i, PuzzleProxy puzzle, bool small) {
    if (i == puzzle.tileCount) {
      assert(puzzle.solved);
      return const Center(
        child: Icon(
          Icons.thumb_up,
          size: 72,
          color: _accentBlue,
        ),
      );
    }

    final correctPosition = puzzle.isCorrectPosition(i);

    final content = createInk(
      Center(
        child: Text(
          (i + 1).toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: correctPosition ? FontWeight.w900 : FontWeight.normal,
            fontSize: small ? 30 : 49,
          ),
        ),
      ),
    );

    return createButton(
      puzzle,
      small,
      i,
      content,
      color: const Color.fromARGB(255, 244, 87, 155),
    );
  }
}
