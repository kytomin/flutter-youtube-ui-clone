import 'package:flutter/material.dart';
import 'package:flutter_youtube_ui/pages/home/home_contract.dart';
import 'package:flutter_youtube_ui/pages/home/home_model.dart';
import 'package:flutter_youtube_ui/pages/home/home_presenter.dart';
import 'package:flutter_youtube_ui/widgets/widgets.dart';

class HomePage extends StatefulWidget {

  final HomePresenter presenter = HomePresenter();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomeContract {
  HomeModel? _model;

  @override
  void initState() {
    widget.presenter.homeView = this;
    super.initState();
  }

  @override
  set model(HomeModel model) {
    _model = model;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(profileImageUrl: _model!.currentUser.profileImageUrl),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 60),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final video = _model!.videos[index];
                return VideoCard(video);
              }, childCount: _model!.videos.length),
            ),
          ),
        ],
      ),
    );
  }
}
