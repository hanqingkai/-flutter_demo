import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() {
    return _StateManagementDemoState();
  }
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;
  _increaseCount() {
    setState(() {
      _count += 1;
    });
    print(_count);
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
        //通过CounterProvider其他的小部件都可以获得 _StateManagementDemoState中的值
        count: _count,
        increaseCount: _increaseCount,
        child: Scaffold(
          appBar: AppBar(
            title: Text('StateMangementDemo'),
            elevation: 0.0,
          ),
          body: CounterWrapper(), //父辈管理状态
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: _increaseCount,
          ),
        ));
  }
}

//用于展示小部件树 向下传递数据
class CounterWrapper extends StatelessWidget {
  //使用InheritedWidget后 不需要传值，可直接在使用是获取
  // final int count;
  // final VoidCallback increaseCount; //用回调函数在父辈有状态的情况下去更改数据
  // CounterWrapper(this.count, this.increaseCount);
  @override
  Widget build(BuildContext context) {
    return Center(
      // child: Counter(count, increaseCount),
      child: Counter(),
    );
  }
}

//由父辈来管理状态
class Counter extends StatelessWidget {
  // final int count;
  // final VoidCallback increaseCount; //用回调函数在父辈有状态的情况下去更改数据
  // Counter(this.count, this.increaseCount);
  @override
  Widget build(BuildContext context) {
    //不用通过传值，直接从counterProvider.of（）中取值
    final int count = CounterProvider.of(context).count;
    final VoidCallback increaseCount =
        CounterProvider.of(context).increaseCount;
    return ActionChip(
      label: Text('$count'),
      onPressed: increaseCount,
    );
  }
}

//InheritedWidget 可以直接把数据传递给需要的小部件
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  CounterProvider({Key key, this.count, this.increaseCount, this.child})
      : super(key: key, child: child);

  final Widget child;
//其他小部件可以通过of方法得到state
  static CounterProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CounterProvider)
        as CounterProvider);
  }

//通知是否继承这个小部件的小部件
  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true; //判断是否需要重建小部件
  }
}
//使用ScopedModel  自行google使用方法
class CounterModel extends Model {
  int _count = 0;
  int get count => _count;
  void increaseCount() {
    _count += 1;
    notifyListeners();
  }
}
