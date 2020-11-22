@JS()
library youtube_player;

import 'package:dart_browser_loader/dart_browser_loader.dart';
import 'package:js/js.dart';

Future<void> loadYoutubeIframeApi() {
  return loadScript(
    'https://www.youtube.com/iframe_api',
    id: 'youtube_iframe_api',
  );
}

@JS('onYouTubeIframeAPIReady')
external set onYouTubeIframeAPIReady(Function f);
