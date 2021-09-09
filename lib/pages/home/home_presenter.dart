import 'package:flutter_youtube_ui/pages/home/home_contract.dart';
import 'package:flutter_youtube_ui/pages/home/home_model.dart';

class HomePresenter {
  HomeContract? _view;
  HomeModel? _model;

  HomePresenter() {
    _model = HomeModel();
  }

  set homeView(HomeContract view) {
    _view = view;
    _view!.model = _model!;
  }
}
