import 'package:flutter_youtube_ui/model/user.dart';
import 'package:flutter_youtube_ui/model/video.dart';

class VideoModel {
  Video get currentVideo => Video(
        id: 'x606y4QWrxo',
        author: User(
            subscribers: '30M',
            username: 'Luis Fonsi',
            profileImageUrl:
                'https://yt3.ggpht.com/QYPST9jyY_OngDj1aIhcGzSwmp6xAciF9bMynKHDWU4XGENtxGJxcHP37kw5khwqZnPneiDr9A=s88-c-k-c0x00ffffff-no-rj'),
        title: 'Luis Fonsi - Despacito ft. Daddy Yankee ',
        thumbnailUrl: 'https://i.ytimg.com/vi/ddv0Qx8lTOE/maxresdefault.jpg',
        duration: '8:20',
        timestamp: DateTime(2021, 3, 20),
        viewCount: '7B',
        likes: '45M',
        dislikes: '5M',
      );

  List<Video> get suggestedVideos => [
        Video(
          id: 'x606y4QWrxo',
          author: User(subscribers: '1M', username: 'NAME', profileImageUrl: 'https://rust.lavik38.ru/img/rust.jpg'),
          title: 'Stream! RUST + CS:GO! - Youtube',
          thumbnailUrl: 'https://i.ytimg.com/vi/W4wocdsy4vQ/maxresdefault.jpg',
          duration: '8:20',
          timestamp: DateTime(2021, 3, 20),
          viewCount: '10K',
          likes: '958',
          dislikes: '4',
        ),
        Video(
          author: User(
              subscribers: '1M',
              username: 'Fortnite',
              profileImageUrl:
                  'https://m.media-amazon.com/images/S/abs-image-upload-na/3/AmazonStores/ATVPDKIKX0DER/34080a6b9a8d1aa8781d6d452215672c.w900.h900._CR0%2C0%2C900%2C900_SX900_.jpg'),
          id: 'vrPk6LB9bjo',
          title: 'Fortnite ASMR gameplay',
          thumbnailUrl: 'https://i.ytimg.com/vi/QjyY40v5-hg/maxresdefault.jpg',
          duration: '22:06',
          timestamp: DateTime(2021, 2, 26),
          viewCount: '8K',
          likes: '485',
          dislikes: '8',
        ),
        Video(
          id: 'ilX5hnH8XoI',
          author: User(
              subscribers: '1M',
              username: 'Warface',
              profileImageUrl:
                  'https://yt3.ggpht.com/ytc/AAUvwnibjHmcxYBIXTCwPPlDYdifgC_eXaKWHcbCoTUt=s900-c-k-c0x00ffffff-no-rj'),
          title: 'Троллинг на РМ Варфейс',
          thumbnailUrl: 'https://pblife.ru/_ld/2/14551538.jpg',
          duration: '10:53',
          timestamp: DateTime(2020, 7, 12),
          viewCount: '18K',
          likes: '1k',
          dislikes: '4',
        ),
      ];
}
