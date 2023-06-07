import 'package:dalali360_app/views/pages/mail/chats.dart';
import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Color(0xFF162945),
              title: Container(
                child: Text("Chats"),
              ),
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                tabs: <Tab>[
                  new Tab(
                    text: "Messages",
                  ),
                  new Tab(
                    text: "Notify",
                  )
                ],
                controller: _tabController,
              ),
            )
          ];
        },
        body: new TabBarView(
            controller: _tabController,
            children: <Widget>[Chat(), Container()]),
      ),
    );
  }
}
