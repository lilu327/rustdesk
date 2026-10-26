const kOptionAndroidTouchScroll = 'android-touch-scroll';

class TouchScrollAccumulator {
  static const pixelsPerTick = 24.0;
  double _pending = 0;

  int consume(double deltaY) {
    _pending += deltaY;
    final ticks = (_pending / pixelsPerTick).truncate();
    _pending -= ticks * pixelsPerTick;
    return ticks;
  }

  void reset() {
    _pending = 0;
  }
}
