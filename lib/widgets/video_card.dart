import 'package:flutter/material.dart';
import 'package:flutter_youtube_ui/model/video.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoCard extends StatelessWidget {
  const VideoCard(this.video, {Key? key, this.hasPadding = false}) : super(key: key);

  final bool hasPadding;
  final Video video;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('open video');
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: hasPadding ? 12 : 0),
            child: Stack(children: [
              Image.network(
                video.thumbnailUrl,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    color: Colors.black,
                    child: Text(
                      video.duration,
                      style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
                    ),
                  )),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => print('Navigate to profile'),
                  child: CircleAvatar(
                    foregroundImage: NetworkImage(video.author.profileImageUrl),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                          child: Text(
                        video.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15),
                      )),
                      Flexible(
                          child: Text(
                        '${video.author.username} • ${video.viewCount} views • ${timeago.format(video.timestamp)}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
                      ))
                    ],
                  ),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.more_vert,
                    size: 20,
                  ),
                  onTap: () {
                    print('tap on more');
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
