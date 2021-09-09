import 'package:flutter_youtube_ui/pages/video_player/video_model.dart';
import 'package:miniplayer/miniplayer.dart';

abstract class VideoContract {
  void updateModel(VideoModel model);
  void animateToHeight(PanelState state);
}
