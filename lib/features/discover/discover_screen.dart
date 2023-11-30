import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';

final List tabs = [
  'Top',
  'Users',
  'Videos',
  'Sounds',
  'LIVE',
  'Shopping',
  'Brands',
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textEditingController = TextEditingController();

  bool _isWriting = false;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabs.length,
      vsync: this,
    );
    _tabController.addListener(() {
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          title: SizedBox(
            height: Sizes.size44,
            child: TextField(
              controller: _textEditingController,
              onChanged: _onSearchChanged,
              expands: true,
              minLines: null,
              maxLines: null,
              textInputAction: TextInputAction.newline,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Sizes.size8),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.grey.shade300,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size10,
                ),
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.size10,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        size: Sizes.size20,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size10,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _textRemover,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          size: Sizes.size20,
                          color: _isWriting
                              ? Colors.grey.shade600
                              : Colors.grey.withAlpha(0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            indicatorColor: Colors.black,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            tabs: [
              for (var tab in tabs) Tab(text: tab),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size6),
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 20,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  Gaps.v5,
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(Sizes.size4),
                      ),
                    ),
                    child: AspectRatio(
                      aspectRatio: 9 / 16,
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        placeholder: "assets/test.jpg",
                        image:
                            "https://images.unsplash.com/photo-1687150434638-1925e0d656ab?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      ),
                    ),
                  ),
                  Gaps.v5,
                  const Text(
                    "something long text for tictok uploading tings. something long text for tictok uploading tings.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Sizes.size16 + Sizes.size2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v8,
                  DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w600,
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 12,
                          backgroundImage: NetworkImage(
                              "https://avatars.githubusercontent.com/u/68258601?v=4"),
                        ),
                        Gaps.h4,
                        const Expanded(
                          child: Text(
                            "My avatar is going to to long long long long",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Gaps.h4,
                        FaIcon(
                          FontAwesomeIcons.heart,
                          size: Sizes.size16,
                          color: Colors.grey.shade600,
                        ),
                        Gaps.h2,
                        const Text(
                          "2.5M",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(fontSize: 28),
                ),
              )
          ],
        ),
      ),
    );
  }

  void _onSearchChanged(String value) {
    if (value != "") {
      _isWriting = true;
    } else {
      _isWriting = false;
    }
    setState(() {});
  }

  void _textRemover() {
    _textEditingController.clear();
  }
}
