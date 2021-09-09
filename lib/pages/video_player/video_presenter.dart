import 'package:flutter_youtube_ui/pages/video_player/video_contract.dart';
import 'package:flutter_youtube_ui/pages/video_player/video_model.dart';

class VideoPresenter {
  VideoContract? _view;
  VideoModel? _model;

  VideoPresenter() {
    _model = VideoModel();
  }

  set videoView(VideoContract view) {
    this._view = view;
    _view!.updateModel(_model!);
  }
}
