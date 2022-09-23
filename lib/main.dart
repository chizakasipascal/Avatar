import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class EspaceClientAppV1 extends StatelessWidget {
  const EspaceClientAppV1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      // initialRoute: Routes.initial,
      home: YourPage(),
    );
  }
}

void main() {
  runApp(const EspaceClientAppV1());
}

class YourPage extends StatefulWidget {
  const YourPage({Key? key}) : super(key: key);

  @override
  _YourPageState createState() => _YourPageState();
}

class _YourPageState extends State<YourPage> {
  late ScrollController _scrollController;
  double _scrollPosition = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();

    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Position $_scrollPosition pixels'),
      ),
      body: Center(
        child: Container(
          color: Colors.amber,
          constraints: const BoxConstraints(
            minHeight: 20.0,
            minWidth: 70.0,
          ),
          height: _scrollPosition == 0 ? 20.0 : _scrollPosition,
          width: _scrollPosition == 0 ? 70.0 : _scrollPosition,
          child: Container(
              child: ListView.builder(
            controller: _scrollController,
            itemCount: 200,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.mood),
                title: Text('Item: $index'),
              );
            },
          )),
        ),
      ),
    );
  }
}
