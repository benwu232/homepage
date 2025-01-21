import 'package:flutter/material.dart';
import 'dart:html' as html;

class TbpsRedirectView extends StatefulWidget {
  final String? data;

  const TbpsRedirectView({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  State<TbpsRedirectView> createState() => _TbpsRedirectViewState();
}

class _TbpsRedirectViewState extends State<TbpsRedirectView> {
  @override
  void initState() {
    super.initState();
    _handleRedirect();
  }

  void _handleRedirect() {
    print('Starting redirect process...');
    print('Data received: ${widget.data}');

    final uri = widget.data != null && widget.data!.isNotEmpty
        ? 'tbps://simulation?data=${widget.data}'
        : 'tbps://simulation';

    print('Redirecting to: $uri');
    html.window.location.href = uri;

    // 更新页面内容，提供手动链接
    final body = html.document.body;
    if (body != null) {
      body.innerHtml = '''
        <div style="
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          height: 100vh;
          font-family: Arial, sans-serif;
        ">
          <p>正在打开 TBPS 应用...</p>
          <p>如果应用没有自动打开，<a href="$uri">请点击这里</a></p>
        </div>
      ''';
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
