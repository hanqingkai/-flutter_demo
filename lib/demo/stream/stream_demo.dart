import 'dart:async';

import 'package:flutter/material.dart';

class StramDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamSubscription;
  StreamController<String> _streamDemo;
  StreamSink _sinkDemo;//水槽
  _addDataToStream() async {
    print('Add data to stream.');
    String data = await fetchData();
    // _streamDemo.add(data);
    _sinkDemo.add(data);
  }

  _pauseStream() {
    print('Pause subscription');
    _streamSubscription.pause();
  }

  _resumeStream() {
    print('Resume subscription');
    _streamSubscription.resume();
  }

  _cancelStream() {
    print('Cancel subscription');
    _streamSubscription.cancel();
  }

  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    print('Create a Stream.');
    // Stream<String> _stramDemo = Stream.fromFuture(fetchData());
    print('Start listening on a stream');
    _streamDemo = StreamController();
    _streamSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);
        _sinkDemo=_streamDemo.sink;
    print('Initialize completed');
  }

  void onData(String event) {
    print('$event');
  }

  void onError(error) {
    print('Erron:$error');
  }

  void onDone() {
    print('Done!');
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    return 'hello ~';
    // throw 'Something Happened';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('Add'),
              onPressed: _addDataToStream,
            ),
            FlatButton(
              child: Text('Pause'),
              onPressed: _pauseStream,
            ),
            FlatButton(
              child: Text('Resume'),
              onPressed: _resumeStream,
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: _cancelStream,
            ),
          ],
        ),
      ),
    );
  }
}
