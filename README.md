[![Dart](https://github.com/leftyio/youtube_iframe_interop/actions/workflows/dart.yml/badge.svg)](https://github.com/leftyio/youtube_iframe_interop/actions/workflows/dart.yml)

# Dart Youtube iframe interop

JS interop for [Youtube Iframe API](https://developers.google.com/youtube/iframe_api_reference)

### Exemple

```dart
import 'package:youtube_iframe_interop/youtube_iframe_interop.dart' as youtube;
import 'package:js/js.dart';

Future<void> main() async {
  await youtube.loadYoutubeIframeApi();

  youtube.onYouTubeIframeAPIReady = allowInterop(iframeReady);
}

void iframeReady() {
  final onReady = (youtube.PlayerEvent e) {
    e.target.playVideo();
  };

  youtube.Player(
    'player',
    youtube.PlayerOptions(
      height: 390,
      width: 640,
      videoId: 'M7lc1UVf-VE',
      events: youtube.Events(
        onReady: allowInterop(onReady),
      ),
    ),
  );
}
```
