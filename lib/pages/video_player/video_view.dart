import 'package:flutter/material.dart';
import 'package:flutter_youtube_ui/pages/video_player/video_contract.dart';
import 'package:flutter_youtube_ui/pages/video_player/video_model.dart';
import 'package:flutter_youtube_ui/pages/video_player/video_presenter.dart';
import 'package:flutter_youtube_ui/widgets/video_card.dart';
import 'package:flutter_youtube_ui/widgets/video_info.dart';
import 'package:miniplayer/miniplayer.dart';

class VideoPlayer extends StatefulWidget {
  final VideoPresenter _presenter = VideoPresenter();
  final miniPlayerController = MiniplayerController();

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> implements VideoContract {
  VideoModel? _model;
  static const double _playerMinHeight = 60;

  @override
  void updateModel(VideoModel model) {
    setState(() {
      _model = model;
    });
  }

  @override
  void animateToHeight(PanelState state) {
    widget.miniPlayerController.animateToHeight(state: state);
  }

  @override
  void initState() {
    widget._presenter.videoView = this;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (_model!.currentVideo == null)
        ? SizedBox.shrink()
        : Miniplayer(
            controller: widget.miniPlayerController,
            minHeight: _playerMinHeight,
            maxHeight: MediaQuery.of(context).size.height,
            builder: (height, percentage) {
              if (height <= _playerMinHeight + 50)
                return Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              constraints: BoxConstraints(minWidth: 120, minHeight: _playerMinHeight - 4),
                              color: Colors.black,
                              child: Image.network(
                                _model!.currentVideo.thumbnailUrl,
                                height: height - 4,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                        child: Text(
                                      _model!.currentVideo.title,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
                                    )),
                                    Flexible(
                                        child: Text(
                                      '${_model!.currentVideo.author.username}',
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.caption!.copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ))
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  print('play video_player');
                                },
                                icon: Icon(Icons.play_arrow)),
                            IconButton(
                                onPressed: () {
                                  print('close video_player');
                                },
                                icon: Icon(Icons.close)),
                          ],
                        ),
                        const LinearProgressIndicator(
                          value: 0.4,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                        ),
                      ],
                    ));
              return _VideoPage(_model!, height - 4);
            });
  }
}

class _VideoPage extends StatelessWidget {
  final VideoModel _model;
  final double _height;

  _VideoPage(this._model, this._height);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            Container(
              color: Colors.black,
              constraints: BoxConstraints(
                maxHeight: _height,
                maxWidth: double.infinity,
              ),
              child: Image.network(
                _model.currentVideo.thumbnailUrl,
                width: double.infinity,
                fit: BoxFit.contain,
                alignment: Alignment.centerLeft,
              ),
            ),
            const LinearProgressIndicator(
              value: 0.4,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
            Expanded(
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: [
                  SliverToBoxAdapter(child: VideoInfo(video: _model.currentVideo)),
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                    return VideoCard(
                      _model.suggestedVideos[index],
                      hasPadding: true,
                    );
                  }, childCount: _model.suggestedVideos.length))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
