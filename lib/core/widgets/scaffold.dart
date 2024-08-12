import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lugia/core/theme.dart';

class FreudScaffold extends StatefulWidget {
  const FreudScaffold({
    super.key,
    required this.appBar,
    required this.builder,
  });

  final Widget appBar;

  final Widget Function(BuildContext context, EdgeInsets padding) builder;

  @override
  State<FreudScaffold> createState() => _FreudScaffoldState();
}

class _FreudScaffoldState extends State<FreudScaffold> {
  final GlobalKey _appBarKey = GlobalKey();

  final GlobalKey _footerKey = GlobalKey();

  double _appBarHeight = 0;

  double _footerHeight = 0;

  void _updateHeights() {
    final appBarContext = _appBarKey.currentContext;
    final footerContext = _footerKey.currentContext;

    if (appBarContext != null) {
      final height = appBarContext.size?.height ?? 0;
      if (height != _appBarHeight) {
        setState(() {
          _appBarHeight = height;
        });
      }
    }

    if (footerContext != null) {
      final height = footerContext.size?.height ?? 0;
      if (height != _footerHeight) {
        setState(() {
          _footerHeight = height;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      _updateHeights();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
    );

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Freud.brown100,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Builder(builder: (context) {
                final padding = MediaQuery.of(context).padding;

                return widget.builder(
                  context,
                  EdgeInsets.only(
                    left: padding.left,
                    top: _appBarHeight != 0 ? _appBarHeight : padding.top,
                    right: padding.right,
                    bottom: _footerHeight != 0 ? _footerHeight : padding.bottom,
                  ),
                );
              }),
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                child: LayoutBuilder(
                  key: _appBarKey,
                  builder: (context, constraints) {
                    return widget.appBar;
                  },
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: LayoutBuilder(
                  key: _footerKey,
                  builder: (context, constraints) {
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
