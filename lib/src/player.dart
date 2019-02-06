@JS()
library youtube_player_interop;

import 'package:js/js.dart';

@JS('onYouTubeIframeAPIReady')
external void set _onYouTubeIframeAPIReady(Function f);

set onYouTubeIframeAPIReady(Function f) =>
    _onYouTubeIframeAPIReady = allowInterop(f);

@JS()
@anonymous
class _PlayerOptions {
  external int get height;
  external int get width;
  external String get videoId;
  external _PlayerEvents get events;

  external factory _PlayerOptions({
    int height,
    int width,
    String videoId,
    _PlayerEvents events,
  });
}

@JS()
@anonymous
class _PlayerEvents {
  external Function get onReady;
  external Function get onStateChange;
  external Function get onPlaybackQualityChange;
  external Function get onPlaybackRateChange;
  external Function get onError;
  external Function get onApiChange;

  external set onReady(Function val);
  external set onStateChange(Function val);
  external set onPlaybackQualityChange(Function val);
  external set onPlaybackRateChange(Function val);
  external set onError(Function val);
  external set onApiChange(Function val);

  external factory _PlayerEvents({
    Function onReady,
    Function onStateChange,
    Function onPlaybackQualityChange,
    Function onPlaybackRateChange,
    Function onError,
    Function onApiChange,
  });
}

class PlayerOptions {
  final _PlayerOptions _optionsInterop;

  PlayerOptions({
    int width,
    int height,
    String videoId,
    PlayerEvents events,
  }) : _optionsInterop = _PlayerOptions(
          width: width,
          height: height,
          videoId: videoId,
          events: events._interop,
        );
}

@JS()
@anonymous
class _PlayerEvent {
  external _Player get target;
  external dynamic get data;
}

class PlayerEvent {
  final Player target;
  final dynamic data;

  PlayerEvent(this.target, this.data);
}

typedef void EventHandler(PlayerEvent event);

Function _captureEventFor(EventHandler handler) => (_PlayerEvent e) {
      handler(PlayerEvent(Player._(e.target), e.data));
    };

class PlayerEvents {
  final _PlayerEvents _interop;

  PlayerEvents({
    EventHandler onReady,
    EventHandler onStateChange,
    EventHandler onPlaybackQualityChange,
    EventHandler onPlaybackRateChange,
    EventHandler onError,
    EventHandler onApiChange,
  }) : _interop = _PlayerEvents() {
    if (onReady != null) {
      _interop.onReady = allowInterop(
        _captureEventFor(onReady),
      );
    }

    if (onStateChange != null) {
      _interop.onStateChange = allowInterop(
        _captureEventFor(onStateChange),
      );
    }

    if (onPlaybackQualityChange != null) {
      _interop.onPlaybackQualityChange = allowInterop(
        _captureEventFor(onPlaybackQualityChange),
      );
    }

    if (onPlaybackRateChange != null) {
      _interop.onPlaybackRateChange = allowInterop(
        _captureEventFor(onPlaybackRateChange),
      );
    }

    if (onError != null) {
      _interop.onError = allowInterop(
        _captureEventFor(onError),
      );
    }

    if (onApiChange != null) {
      _interop.onApiChange = allowInterop(
        _captureEventFor(onApiChange),
      );
    }
  }
}

@JS('YT.Player')
class _Player {
  external _Player(dynamic id, [_PlayerOptions options]);

  external void playVideo();

  external void pauseVideo();

  external void stopVideo();

  external void loadVideoById(
    String id, [
    num startSeconds,
    String suggestedQuality,
  ]);

  external void cueVideoById(
    String id, [
    num startSeconds,
    String suggestedQuality,
  ]);

  external void setSize(int width, int height);

  external void destroy();
}

mixin PlayerMixin {
  _Player get _playerInterop;

  void play() => _playerInterop.playVideo();

  void pause() => _playerInterop.pauseVideo();

  void stop() => _playerInterop.stopVideo();

  void loadVideoById(
    String id, {
    num startSeconds,
    String suggestedQuality,
  }) =>
      _playerInterop.loadVideoById(id, startSeconds, suggestedQuality);

  void cueVideoById(
    String id, {
    num startSeconds,
    String suggestedQuality,
  }) =>
      _playerInterop.cueVideoById(id, startSeconds, suggestedQuality);

  void setSize(int width, int height) => _playerInterop.setSize(width, height);

  void dispose() => _playerInterop.destroy();
}

class Player extends Object with PlayerMixin {
  final _Player _playerInterop;

  Player(
    dynamic id, {
    PlayerOptions options,
  }) : _playerInterop = _Player(
          id,
          options._optionsInterop,
        );

  Player._(this._playerInterop);
}
