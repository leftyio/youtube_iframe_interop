# Dart Youtube iframe interop

JS interop for [Youtube Iframe API](https://developers.google.com/youtube/iframe_api_reference)

### Exemple

```dart
import 'package:youtube_iframe_interop/youtube_iframe_interop.dart' as youtube;

Future<void> main() async {
  await youtube.loadYoutubeIframApi();

  final videoId = 'RDfjXj5EGqI';

  final player = youtube.Player(
    'container',
    options: youtube.PlayerOptions(videoId: videoId),
  );

  player.play();

  //player.dispose();
}
```