// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library test_curses;

import 'dart:math' as math;

import 'package:curses/curses.dart';

void main() {
  stdscr.setup(
      autoRefresh: true,
      cursorVisibility: CursorVisibility.INVISIBLE,
      escDelay: 1);

  stdscr.init_pair(1, Color.RED, Color.BLACK);

  stdscr.addstr('hola',
      location: math.Point(1, 1),
      colorPair: 1,
      attributes: [Attribute.REVERSE]);
  stdscr.addstr('adios', location: math.Point(2, 1));
  stdscr.addstr('mundo',
      location: math.Point(3, 1), colorPair: 1, attributes: [Attribute.BOLD]);

  var size = stdscr.getmaxyx();
  stdscr.addstr('${size.x} x ${size.y}', location: math.Point(4, 1));
  stdscr.addstr('XXX', location: math.Point(size.y - 1, size.x - 4));

  var w = new Window(math.Rectangle(10, 10, 10, 10), autoRefresh: true);
  w.border();
  w.addstr('Lili', location: math.Point(1, 1));
  //w.clear();

  var w2 = new Window(math.Rectangle(20, 10, 10, 10), autoRefresh: true);
  w2.border();
  w2.addstr('Lolo', location: math.Point(1, 1));

  w.wgetch().then((key) {
    w.dispose();
    stdscr.dispose();

    var strKey = new String.fromCharCode(key.keyCode);
    print("key = $strKey");
  });
}
