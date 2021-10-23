// ignore_for_file: non_constant_identifier_names

@JS()
library youtube;

import 'dart:html';

import 'package:js/js.dart';

/// Type definitions for YouTube
/// Project: https://developers.google.com/youtube/
/// Definitions by: Ian Obermiller <http://ianobermiller.com>,
/// Josh Goldberg <https://github.com/JoshuaKGoldberg>
/// Eliot Fallon <https://github.com/eliotfallon213>
/// Terry Mun <https://github.com/terrymun>
/// Paul Hobbel <https://github.com/paulhobbel>
/// Definitions: https://github.com/DefinitelyTyped/DefinitelyTyped
/// TypeScript Version: 2.1

/// @see https://developers.google.com/youtube/iframe_api_reference
/// @see https://developers.google.com/youtube/player_parameters

// Module YT
/// State of a video player.
@JS('YT.PlayerState')
class PlayerState {
  external static num get UNSTARTED;
  external static num get ENDED;
  external static num get PLAYING;
  external static num get PAUSED;
  external static num get BUFFERING;
  external static num get CUED;
}

/// Known causes for player errors.
@JS('YT.PlayerError')
class PlayerError {
  external static num get

      /// The request contained an invalid parameter value.
      InvalidParam;
  external static num get

      /// The requested content cannot be played in an HTML5 player.
      Html5Error;
  external static num get

      /// The video requested was not found.
      VideoNotFound;
  external static num get

      /// The owner of the requested video does not allow it to be played in embedded players.
      EmbeddingNotAllowed;
  external static num get

      /// This error is the same as 101. It's just a 101 error in disguise!
      EmbeddingNotAllowed2;
}

/// Whether to auto-hide video controls.
@JS('YT.AutoHide')
class AutoHide {
  external static num get

      /// Controls are visible throughout the video
      AlwaysVisible;
  external static num get

      /// Progress bar and player controls slide out of view after a couple of seconds.
      HideAllControls;
  external static num get

      /// Progress bar fades out while the player controls remain visible.
      HideProgressBar;
}

/// Whether to autoplay the video.
@JS('YT.AutoPlay')
class YTAutoPlay {
  external static num get

      /// Video does not autoplay.
      NoAutoPlay;
  external static num get

      /// Video will autoplay when loaded.
      AutoPlay;
}

/// Whether to use user-preferred or forced caption loading.
@JS('YT.ClosedCaptionsLoadPolicy')
class ClosedCaptionsLoadPolicy {
  external static num get

      /// Defaults to the user's preferences.
      UserDefault;
  external static num get

      /// For closed captions to be shown.
      ForceOn;
}

/// Allowed progress bar colors.
/*export type ProgressBarColor = "red" | "white";*/
/// How video controls are shown.
@JS('YT.Controls')
class Controls {
  external static num get

      /// Player controls do not display.
      Hide;
  external static num get

      /// Player controls display.
      ShowLoadPlayer;
  external static num get

      /// Player controls display after a delay.
      ShowDelayLoadPlayer;
}

/// Whether to allow keyboard controls.
@JS('YT.KeyboardControls')
class KeyboardControls {
  external static num get

      /// Keyboard controls are enabled.
      Enable;
  external static num get

      /// Keyboard controls are disabled.
      Disable;
}

/// Whether the JavaScript API should be enabled.
@JS('YT.JsApi')
class JsApi {
  external static num get

      /// JavaScript API will be disabled.
      Disable;
  external static num get

      /// JavaScript API will be enabled.
      Enable;
}

/// Whether to display the full-screen button.
@JS('YT.FullscreenButton')
class FullscreenButton {
  external static num get

      /// The full screen button is hidden.
      Hide;
  external static num get

      /// The full screen button is visible.
      Show;
}

/// Whether to show video annotations.
@JS('YT.IvLoadPolicy')
class IvLoadPolicy {
  external static num get

      /// Video annotations will be shown.
      Show;
  external static num get

      /// Video annotations will not be shown.
      Hide;
}

/// Which type of content loads in the player.
/*export type ListType = ListTypePlayer | ListTypeSearch | ListTypeUserUploads;*/
/// The requested video should be shown in the player.
/*export type ListTypePlayer = "player";*/
/// A search area should be shown in the player.
/*export type ListTypeSearch = "search";*/
/// The user's uploads should load in the player.
/*export type ListTypeUserUploads = "user_uploads";*/
/// Whether a single video should be looped.
@JS('YT.Loop')
class YTLoop {
  external static num get

      /// Video or playlist will be played only once.
      SinglePlay;
  external static num get

      /// Video or playlist will be played over and over again.
      Loop;
}

/// Comma separated list of video IDs to play after the URL path's video.
@JS('YT.ModestBranding')
class ModestBranding {
  external static num get

      /// Player will contain full YouTube branding.
      Full;
  external static num get

      /// YouTube logo will not display in the control bar.
      Modest;
}

/// Whether to playback video inline or full-screen in an HTML5 player on iOS
@JS('YT.PlaysInline')
class PlaysInline {
  external static num get

      /// Playback in fullscreen.
      Fullscreen;
  external static num get

      /// Playback inline
      Inline;
}

/// Whether to show related videos after the video finishes.
@JS('YT.RelatedVideos')
class RelatedVideos {
  external static num get

      /// Hide related videos after playback is complete.
      Hide;
  external static num get

      /// Show related videos after playback is complete.
      Show;
}

/// Whether to show video information before playing.
@JS('YT.ShowInfo')
class ShowInfo {
  external static num get

      /// Hide video title and uploader before video starts playing.
      Hide;
  external static num get

      /// Show video title and uploader before video starts playing.
      Show;
}

/// Base interface for events triggered by a player.
@anonymous
@JS()
abstract class PlayerEvent {
  /// Video player corresponding to the event.
  external Player get target;
  external set target(Player v);
  external factory PlayerEvent({Player target});
}

/// Event for player state change.
@anonymous
@JS()
abstract class OnStateChangeEvent implements PlayerEvent {
  /// New player state.
  external num /*enum PlayerState*/ get data;
  external set data(num /*enum PlayerState*/ v);
  external factory OnStateChangeEvent(
      {num /*enum PlayerState*/ data, Player target});
}

/// Event for playback quality change.
@anonymous
@JS()
abstract class OnPlaybackQualityChangeEvent implements PlayerEvent {
  /// New playback quality.
  external String get data;
  external set data(String v);
  external factory OnPlaybackQualityChangeEvent({String data, Player target});
}

/// Event for playback rate change.
@anonymous
@JS()
abstract class OnPlaybackRateChangeEvent implements PlayerEvent {
  /// New playback rate.
  external num get data;
  external set data(num v);
  external factory OnPlaybackRateChangeEvent({num data, Player target});
}

/// Event for a player error.
@anonymous
@JS()
abstract class OnErrorEvent implements PlayerEvent {
  /// Which type of error occurred.
  external num /*enum PlayerError*/ get data;
  external set data(num /*enum PlayerError*/ v);
  external factory OnErrorEvent({num /*enum PlayerError*/ data, Player target});
}

/// Handles a player event.
typedef PlayerEventHandler<TEvent extends PlayerEvent> = void Function(
    TEvent event);

/// YouTube player options.
@anonymous
@JS()
abstract class PlayerOptions {
  /// Player width.
  external dynamic /*String|num*/ get width;
  external set width(dynamic /*String|num*/ v);

  /// Player height
  external dynamic /*String|num*/ get height;
  external set height(dynamic /*String|num*/ v);

  /// ID of the video to load.
  external String get videoId;
  external set videoId(String v);

  /// Player parameters.
  external PlayerVars get playerVars;
  external set playerVars(PlayerVars v);

  /// Handlers for events fired by the player.
  external Events get events;
  external set events(Events v);

  /// Points host to correct origin for CORS
  external String get host;
  external set host(String v);
  external factory PlayerOptions(
      {dynamic /*String|num*/ width,
      dynamic /*String|num*/ height,
      String videoId,
      PlayerVars playerVars,
      Events events,
      String host});
}

/// Allowed suggested player video qualities.
/*export type SuggestedVideoQuality =
    | VideoQualityDefault
    | VideoQualitySmall
    | VideoQualityMedium
    | VideoQualityLarge
    | VideoQualityHD720
    | VideoQualityHD1080
    | VideoQualityHighRes;
*/
/// Default video quality chosen by YouTube.
/*export type VideoQualityDefault = "default";*/
/// Player height is 240px, and player dimensions are at least 320px by 240px for 4:3 aspect ratio.
/*export type VideoQualitySmall = "small";*/
/// Player height is 360px, and player dimensions are 640px by 360px (for 16:9 aspect ratio) or 480px by 360px (for 4:3 aspect ratio).
/*export type VideoQualityMedium = "medium";*/
/// Player height is 480px, and player dimensions are 853px by 480px (for 16:9 aspect ratio) or 640px by 480px (for 4:3 aspect ratio).
/*export type VideoQualityLarge = "large";*/
/// Player height is 720px, and player dimensions are 1280px by 720px (for 16:9 aspect ratio) or 960px by 720px (for 4:3 aspect ratio).
/*export type VideoQualityHD720 = "hd720";*/
/// Player height is 1080px, and player dimensions are 1920px by 1080px (for 16:9 aspect ratio) or 1440px by 1080px (for 4:3 aspect ratio).
/*export type VideoQualityHD1080 = "hd1080";*/
/// Player height is greater than 1080px, which means that the player's aspect ratio is greater than 1920px by 1080px.
/*export type VideoQualityHighRes = "highres";*/
/// Player parameters.
@anonymous
@JS()
abstract class PlayerVars {
  /// Whether to autohide video controls (by default, HideProgressBar).
  external num /*enum AutoHide*/ get autohide;
  external set autohide(num /*enum AutoHide*/ v);

  /// Whether to autoplay the video (by default, NoAutoPlay).
  external num /*enum AutoPlay*/ get autoplay;
  external set autoplay(num /*enum AutoPlay*/ v);

  /// Whether to use user-preferred or forced caption loading (by default, UserDefault).
  external num /*enum ClosedCaptionsLoadPolicy*/ get cc_load_policy;
  external set cc_load_policy(num /*enum ClosedCaptionsLoadPolicy*/ v);

  /// Player progress bar color
  external String /*'red'|'white'*/ get color;
  external set color(String /*'red'|'white'*/ v);

  /// How video controls are shown (by default, ShowLoadPlayer).
  external num /*enum Controls*/ get controls;
  external set controls(num /*enum Controls*/ v);

  /// Whether to allow keyboard controls (by default, Enable).
  external num /*enum KeyboardControls*/ get disablekb;
  external set disablekb(num /*enum KeyboardControls*/ v);

  /// Whether the JavaScript API should be enabled (by default, Disable).
  external num /*enum JsApi*/ get enablejsapi;
  external set enablejsapi(num /*enum JsApi*/ v);

  /// Time, in seconds from the beginning of the video, when to stop playing.
  external num get end;
  external set end(num v);

  /// Whether to display the full-screen button (by default, Show).
  external num /*enum FullscreenButton*/ get fs;
  external set fs(num /*enum FullscreenButton*/ v);

  /// Player language as an ISO 639-1 two-letter language code or fully-specified locale.
  external String get hl;
  external set hl(String v);

  /// Whether to show video annotations (by default, Show).
  external num /*enum IvLoadPolicy*/ get iv_load_policy;
  external set iv_load_policy(num /*enum IvLoadPolicy*/ v);

  /// Identifies content that will load.
  /// If listType is search, this is the search query.
  /// If listType is user_uploads, this is the YouTube user.
  /// If listType is playlist, this is the playlist ID, prepended by 'PL'.
  external String get list;
  external set list(String v);

  /// Which type of content loads in the player.
  external String /*'player'|'search'|'user_uploads'*/ get listType;
  external set listType(String /*'player'|'search'|'user_uploads'*/ v);

  /// Whether a single video should be looped (by default, SinglePlay).
  external num /*enum Loop*/ get loop;
  external set loop(num /*enum Loop*/ v);

  /// Whether to hide some YouTube branding (by default, Full).
  external num /*enum ModestBranding*/ get modestbranding;
  external set modestbranding(num /*enum ModestBranding*/ v);

  /// Origin domain for additional security if using the JavaScript API.
  external String get origin;
  external set origin(String v);

  /// Comma separated list of video IDs to play after the URL path's video.
  external String get playlist;
  external set playlist(String v);

  /// Whether videos play inline or fullscreen in an HTML5 player on iOS. (currently by default, Fullscreen).
  external num /*enum PlaysInline*/ get playsinline;
  external set playsinline(num /*enum PlaysInline*/ v);

  /// Whether to show related videos after the video finishes (by default, Show).
  external num /*enum RelatedVideos*/ get rel;
  external set rel(num /*enum RelatedVideos*/ v);

  /// Whether to show video information before playing (by default, Show).
  external num /*enum ShowInfo*/ get showinfo;
  external set showinfo(num /*enum ShowInfo*/ v);

  /// Time, in seconds from the beginning of the video, when to start playing.
  external num get start;
  external set start(num v);
  external factory PlayerVars(
      {num /*enum AutoHide*/ autohide,
      num /*enum AutoPlay*/ autoplay,
      num /*enum ClosedCaptionsLoadPolicy*/ cc_load_policy,
      String /*'red'|'white'*/ color,
      num /*enum Controls*/ controls,
      num /*enum KeyboardControls*/ disablekb,
      num /*enum JsApi*/ enablejsapi,
      num end,
      num /*enum FullscreenButton*/ fs,
      String hl,
      num /*enum IvLoadPolicy*/ iv_load_policy,
      String list,
      String /*'player'|'search'|'user_uploads'*/ listType,
      num /*enum Loop*/ loop,
      num /*enum ModestBranding*/ modestbranding,
      String origin,
      String playlist,
      num /*enum PlaysInline*/ playsinline,
      num /*enum RelatedVideos*/ rel,
      num /*enum ShowInfo*/ showinfo,
      num start});
}

/// Handlers for events fired by the player.
@anonymous
@JS()
abstract class Events {
  /// Event fired when a player has finished loading and is ready to begin receiving API calls.
  external PlayerEventHandler<PlayerEvent> get onReady;
  external set onReady(PlayerEventHandler<PlayerEvent> v);

  /// Event fired when the player's state changes.
  external PlayerEventHandler<OnStateChangeEvent> get onStateChange;
  external set onStateChange(PlayerEventHandler<OnStateChangeEvent> v);

  /// Event fired when the playback quality of the player changes.
  external PlayerEventHandler<OnPlaybackQualityChangeEvent>
      get onPlaybackQualityChange;
  external set onPlaybackQualityChange(
      PlayerEventHandler<OnPlaybackQualityChangeEvent> v);

  /// Event fired when the playback rate of the player changes.
  external PlayerEventHandler<OnPlaybackRateChangeEvent>
      get onPlaybackRateChange;
  external set onPlaybackRateChange(
      PlayerEventHandler<OnPlaybackRateChangeEvent> v);

  /// Event fired when an error in the player occurs
  external PlayerEventHandler<OnErrorEvent> get onError;
  external set onError(PlayerEventHandler<OnErrorEvent> v);

  /// Event fired to indicate thath the player has loaded, or unloaded, a module
  /// with exposed API methods. This currently only occurs for closed captioning.
  external PlayerEventHandler<PlayerEvent> get onApiChange;
  external set onApiChange(PlayerEventHandler<PlayerEvent> v);
  external factory Events(
      {PlayerEventHandler<PlayerEvent> onReady,
      PlayerEventHandler<OnStateChangeEvent> onStateChange,
      PlayerEventHandler<OnPlaybackQualityChangeEvent> onPlaybackQualityChange,
      PlayerEventHandler<OnPlaybackRateChangeEvent> onPlaybackRateChange,
      PlayerEventHandler<OnErrorEvent> onError,
      PlayerEventHandler<PlayerEvent> onApiChange});
}

/// Settings to load, play, or queue a video or playlist.
@anonymous
@JS()
abstract class VideoOrPlaylistSettings {
  /// Time, in seconds from the beginning of the (first) video, when to start playing.
  external num get startSeconds;
  external set startSeconds(num v);

  /// Time, in seconds from the end of the (first) video, when to end playing.
  external num get endSeconds;
  external set endSeconds(num v);

  /// Suggested video player quality.
  external String /*'default'|'small'|'medium'|'large'|'hd720'|'hd1080'|'highres'*/ get suggestedQuality;
  external set suggestedQuality(
      String /*'default'|'small'|'medium'|'large'|'hd720'|'hd1080'|'highres'*/ v);
  external factory VideoOrPlaylistSettings(
      {num startSeconds,
      num endSeconds,
      String /*'default'|'small'|'medium'|'large'|'hd720'|'hd1080'|'highres'*/ suggestedQuality});
}

/// Settings to play or queue a video by ID.
@anonymous
@JS()
abstract class VideoByIdSettings implements VideoOrPlaylistSettings {
  /// Video ID.
  external String get videoId;
  external set videoId(String v);
  external factory VideoByIdSettings(
      {String videoId,
      num startSeconds,
      num endSeconds,
      String /*'default'|'small'|'medium'|'large'|'hd720'|'hd1080'|'highres'*/ suggestedQuality});
}

/// Settings to play or queue a video by media content URL.
@anonymous
@JS()
abstract class VideoByMediaContentUrlSettings
    implements VideoOrPlaylistSettings {
  /// Fully qualified player URL.
  external String get mediaContentUrl;
  external set mediaContentUrl(String v);
  external factory VideoByMediaContentUrlSettings(
      {String mediaContentUrl,
      num startSeconds,
      num endSeconds,
      String /*'default'|'small'|'medium'|'large'|'hd720'|'hd1080'|'highres'*/ suggestedQuality});
}

/// Settings to load or queue a playlist.
@anonymous
@JS()
abstract class IPlaylistSettings implements VideoOrPlaylistSettings {
  /// Identifier for the listType videos list.
  external String get list;
  external set list(String v);

  /// Which type of content loads in the player.
  external String /*'player'|'search'|'user_uploads'*/ get listType;
  external set listType(String /*'player'|'search'|'user_uploads'*/ v);

  /// Start index of the playlist, if not 0.
  external num get index;
  external set index(num v);
  external factory IPlaylistSettings(
      {String list,
      String /*'player'|'search'|'user_uploads'*/ listType,
      num index,
      num startSeconds,
      num endSeconds,
      String /*'default'|'small'|'medium'|'large'|'hd720'|'hd1080'|'highres'*/ suggestedQuality});
}

/// Creates and controls a YouTube player in an <iframe>.
@JS('YT.Player')
class Player {
  /// Initializes a new instance of the Player class.
  /*external factory Player(HTMLElement elt, PlayerOptions options);*/
  /// Initializes a new instance of the Player class.
  /*external factory Player(String id, PlayerOptions options);*/
  external factory Player(
      dynamic /*HTMLElement|String*/ elt_id, PlayerOptions options);

  /// Queues a video by ID.
  /*external void cueVideoById(String videoId, [num startSeconds, 'default'|'small'|'medium'|'large'|'hd720'|'hd1080'|'highres' suggestedQuality]);*/
  /// Queues a video by ID.
  /*external void cueVideoById(VideoByIdSettings args);*/
  external void cueVideoById(dynamic /*String|VideoByIdSettings*/ videoId_args,
      [num startSeconds,
      String /*'default'|'small'|'medium'|'large'|'hd720'|'hd1080'|'highres'*/ suggestedQuality]);

  /// Loads and plays a video by ID.
  /*external void loadVideoById(String videoId, [num startSeconds, 'default'|'small'|'medium'|'large'|'hd720'|'hd1080'|'highres' suggestedQuality]);*/
  /// Loads and plays a video by ID.
  /*external void loadVideoById(VideoByIdSettings args);*/
  external void loadVideoById(dynamic /*String|VideoByIdSettings*/ videoId_args,
      [num startSeconds,
      String /*'default'|'small'|'medium'|'large'|'hd720'|'hd1080'|'highres'*/ suggestedQuality]);

  /// Queues a video by media content URL.
  /*external void cueVideoByUrl(String mediaContentUrl, [num startSeconds, 'default'|'small'|'medium'|'large'|'hd720'|'hd1080'|'highres' suggestedQuality]);*/
  /// Queues a video by media content URL.
  /*external void cueVideoByUrl(VideoByMediaContentUrlSettings args);*/
  external void cueVideoByUrl(
      dynamic /*String|VideoByMediaContentUrlSettings*/ mediaContentUrl_args,
      [num startSeconds,
      String /*'default'|'small'|'medium'|'large'|'hd720'|'hd1080'|'highres'*/ suggestedQuality]);

  /// Loads a video by media content URL.
  /*external void loadVideoByUrl(String mediaContentUrl, [num startSeconds, 'default'|'small'|'medium'|'large'|'hd720'|'hd1080'|'highres' suggestedQuality]);*/
  /// Loads a video by media content URL.
  /*external void loadVideoByUrl({
      mediaContentUrl: string;
      startSeconds?: number;
      endSeconds?: number;
      suggestedQuality?: SuggestedVideoQuality;
    } args);*/
  external void loadVideoByUrl(
      dynamic
          /*String|{
      mediaContentUrl: string;
      startSeconds?: number;
      endSeconds?: number;
      suggestedQuality?: SuggestedVideoQuality;
    }*/
          mediaContentUrl_args,
      [num startSeconds,
      String /*'default'|'small'|'medium'|'large'|'hd720'|'hd1080'|'highres'*/ suggestedQuality]);

  /// Queues a playlist of videos.
  /*external void cuePlaylist(String|List<String> playlist, [num index, num startSeconds, 'default'|'small'|'medium'|'large'|'hd720'|'hd1080'|'highres' suggestedQuality]);*/
  /// Queues a playlist of videos.
  /*external void cuePlaylist(IPlaylistSettings args);*/
  external void cuePlaylist(
      dynamic /*String|List<String>|IPlaylistSettings*/ playlist_args,
      [num index,
      num startSeconds,
      String /*'default'|'small'|'medium'|'large'|'hd720'|'hd1080'|'highres'*/ suggestedQuality]);

  /// Loads a playlist of videos.
  /*external void loadPlaylist(String|List<String> playlist, [num index, num startSeconds, 'default'|'small'|'medium'|'large'|'hd720'|'hd1080'|'highres' suggestedQuality]);*/
  /// Loads a playlist of videos.
  /*external void loadPlaylist(IPlaylistSettings args);*/
  external void loadPlaylist(
      dynamic /*String|List<String>|IPlaylistSettings*/ playlist_args,
      [num index,
      num startSeconds,
      String /*'default'|'small'|'medium'|'large'|'hd720'|'hd1080'|'highres'*/ suggestedQuality]);

  /// Plays the currently cued/loaded video.
  external void playVideo();

  /// Pauses the currently playing video.
  external void pauseVideo();

  /// Stops and cancels loading of the current video.
  external void stopVideo();

  /// Seeks to a specified time in the video.
  external void seekTo(num seconds, bool allowSeekAhead);

  /// Loads and plays the next video in the playlist.
  external void nextVideo();

  /// Loads and plays the previous video in the playlist.
  external void previousVideo();

  /// Loads and plays the specified video in the playlist.
  external void playVideoAt(num index);

  /// Mutes the player.
  external void mute();

  /// Unmutes the player.
  external void unMute();
  external bool isMuted();

  /// Sets the player volume.
  external void setVolume(num volume);
  external num getVolume();

  /// Sets the size in pixels of the <iframe> that contains the player.
  external void setSize(num width, num height);
  external num getPlaybackRate();

  /// Sets the suggested playback rate for the current video.
  external void setPlaybackRate(num suggestedRate);
  external List<num> getAvailablePlaybackRates();

  /// Sets whether the player should continuously play a playlist.
  external void setLoop(bool loopPlaylists);

  /// Sets whether a playlist's videos should be shuffled.
  external void setShuffle(bool shufflePlaylist);
  external num getVideoLoadedFraction();
  external num /*enum PlayerState*/ getPlayerState();
  external num getCurrentTime();
  external String /*'default'|'small'|'medium'|'large'|'hd720'|'hd1080'|'highres'*/ getPlaybackQuality();

  /// Sets the suggested video quality for the current video.
  external void setPlaybackQuality(
      String /*'default'|'small'|'medium'|'large'|'hd720'|'hd1080'|'highres'*/ suggestedQuality);
  external List<
          String /*'default'|'small'|'medium'|'large'|'hd720'|'hd1080'|'highres'*/ >
      getAvailableQualityLevels();
  external num getDuration();
  external String getVideoUrl();
  external String getVideoEmbedCode();
  external List<String> getPlaylist();
  external num getPlaylistIndex();

  /// Adds an event listener for the specified event.
  external void addEventListener/*<TEvent extends PlayerEvent>*/(
      dynamic /*keyof Events*/ eventName,
      void Function(dynamic /*TEvent*/ event) listener);

  /// Remove an event listener for the specified event.
  external void removeEventListener/*<TEvent extends PlayerEvent>*/(
      dynamic /*keyof Events*/ eventName,
      void Function(dynamic /*TEvent*/ event) listener);
  external IFrameElement getIframe();

  /// Removes the <iframe> containing the player.
  external void destroy();
}

// End module YT
