import 'package:youtube_iframe_interop/youtube_iframe_interop.dart' as youtube;

Future<void> main() async {
  await youtube.loadYoutubeIframApi();

  youtube.onYouTubeIframeAPIReady = () {
    youtube.Player player;

    final onReady = (youtube.PlayerEvent e) {
      e.target.play();
      //player.play();

      //player.dispose();
    };

    player = youtube.Player(
      'player',
      options: youtube.PlayerOptions(
        height: 390,
        width: 640,
        videoId: 'M7lc1UVf-VE',
        events: youtube.PlayerEvents(
          onReady: onReady,
        ),
      ),
    );
  };
}
