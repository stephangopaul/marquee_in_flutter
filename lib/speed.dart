enum Speed { slowest, slow, normal, fast }

extension SpeedExtensionForScroll on Speed {
  Duration get moveDuration {
    switch (this) {
      case Speed.slowest:
        return Duration(milliseconds: 500);
      case Speed.slow:
        return Duration(milliseconds: 100);
      case Speed.normal:
        return Duration(milliseconds: 50);
      case Speed.fast:
        return Duration(milliseconds: 25);
    }
  }
}

extension SpeedExtensionForAlternate on Speed {
  Duration get animationDuration {
    switch (this) {
      case Speed.slowest:
        return Duration(milliseconds: 2000);
      case Speed.slow:
        return Duration(milliseconds: 1500);
      case Speed.normal:
        return Duration(milliseconds: 1000);
      case Speed.fast:
        return Duration(milliseconds: 500);
    }
  }

  Duration get backDuration {
    return animationDuration;
  }

  Duration get pauseDuration {
    return animationDuration;
  }
}
