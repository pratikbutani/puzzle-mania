import 'package:flutter/material.dart';

import 'base_theme.dart';
import 'shared_theme.dart';

const _yellowIsh = Color.fromARGB(255, 248, 244, 233);
const _chocolate = Color.fromARGB(255, 66, 66, 68);
const _orangeIsh = Color.fromARGB(255, 224, 107, 83);

class ThemePlaster extends SharedTheme {
  ThemePlaster(AppState baseTheme) : super('Plaster', baseTheme);

  @override
  Color get puzzleThemeBackground => _chocolate;

  @override
  Color get puzzleBackgroundColor => _yellowIsh;

  @override
  final puzzleBorder = RoundedRectangleBorder(
    side: const BorderSide(
      color: Color.fromARGB(255, 103, 103, 105),
      width: 5,
    ),
    borderRadius: BorderRadius.circular(5),
  );

  @override
  Widget tileButton(int i) {
    final correctColumn = i % puzzle.width;
    final correctRow = i ~/ puzzle.width;

    final primary = (correctColumn + correctRow).isEven;

    if (i == puzzle.tileCount) {
      if (puzzle.solved) {
        return const Center(
            child: Icon(
          Icons.thumb_up,
          size: 36,
          color: _chocolate,
        ));
      }
      return const Center();
    }

    return RaisedButton(
      elevation: 1,
      child: Text(
        (i + 1).toString(),
        style: TextStyle(
          color: primary ? _yellowIsh : _chocolate,
          fontFamily: 'Plaster',
        ),
        textScaleFactor: 2.5,
      ),
      onPressed: tilePress(i),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: primary ? _chocolate : _orangeIsh, width: 3),
        borderRadius: BorderRadius.circular(2),
      ),
      padding: const EdgeInsets.symmetric(),
      color: primary ? _orangeIsh : _yellowIsh,
      disabledColor: primary ? _orangeIsh : _yellowIsh,
    );
  }
}