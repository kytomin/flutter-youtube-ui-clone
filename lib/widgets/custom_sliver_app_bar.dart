import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({Key? key, required this.profileImageUrl}) : super(key: key);

  final String profileImageUrl;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        floating: true,
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset('assets/yt_logo_dark.png'),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.cast)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {},
              iconSize: 40,
              icon: CircleAvatar(
                foregroundImage: NetworkImage(profileImageUrl),
              ))
        ]);
  }
}
