import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hbb/utils/touch_scroll_accumulator.dart';

void main() {
  test('finger swipes emit natural wheel directions and preserve small moves',
      () {
    final scroll = TouchScrollAccumulator();
    expect(scroll.consume(-12), 0);
    expect(scroll.consume(-12), -1);
    expect(scroll.consume(-48), -2);
    expect(scroll.consume(24), 1);
  });

  test('ending a gesture discards its incomplete wheel movement', () {
    final scroll = TouchScrollAccumulator();
    expect(scroll.consume(-23), 0);
    scroll.reset();
    expect(scroll.consume(-1), 0);
    expect(scroll.consume(-23), -1);
  });
}
