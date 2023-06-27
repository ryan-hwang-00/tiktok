import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.size14,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.grey.shade50,
          appBar: AppBar(
            backgroundColor: Colors.grey.shade50,
            title: const Text("12341"),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: _onClosePressed,
                icon: const FaIcon(FontAwesomeIcons.xmark),
              ),
            ],
          ),
          body: ListView.separated(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size10,
              horizontal: Sizes.size16,
            ),
            separatorBuilder: (context, index) => Gaps.v20,
            itemCount: 10,
            itemBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  // foregroundImage: NetworkImage(
                  //     "https://avatars.githubusercontent.com/u/68258601?v=4"),
                  child: Text("nico"),
                ),
                Gaps.h10,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ingyu hwang',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Sizes.size14,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Gaps.v3,
                      const Text(
                          'some kind of text some kind of text some kind of text some kind of text some kind of text some kind of text some kind of text some kind of text some kind of text some kind of text some kind of text some kind of text'),
                    ],
                  ),
                ),
                Gaps.h10,
                Column(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.heart,
                      size: Sizes.size20,
                      color: Colors.grey.shade500,
                    ),
                    Gaps.v2,
                    Text(
                      '2.2K',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  // foregroundImage: NetworkImage(
                  //     "https://avatars.githubusercontent.com/u/68258601?v=4"),
                  child: Text("nico"),
                ),
              ],
            ),
          )),
    );
  }
}
