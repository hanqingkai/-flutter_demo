import 'package:flutter/material.dart';
import 'package:flutter_app/model/post.dart';

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _posts.length;

  @override
  int get selectedRowCount => _selectedCount;
  @override
  DataRow getRow(int index) {
    final Post post = _posts[index];
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text(post.title)),
      DataCell(Text(post.author)),
      DataCell(Image.network(post.imageUrl)),
    ]);
  }

  void _sort(getField(post), bool ascending) {
    _posts.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }
      final aValue = getField(a);
      final bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }
}

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;
  final PostDataSource _postsDataSource = PostDataSource();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_WidgetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              rowsPerPage: 5, //行数
              header: Text('Posts'),
              source: _postsDataSource,
              sortColumnIndex: _sortColumnIndex, //排序,有小箭头
              sortAscending: _sortAscending, //升序排列

              columns: [
                DataColumn(
                    label: Text('title'),
                    onSort: (int columnindex, bool ascending) {
                      _postsDataSource._sort(
                          (post) => post.title.length, ascending);
                      setState(() {
                        _sortColumnIndex = columnindex;
                        _sortAscending = ascending;
                      });
                    }),
                DataColumn(label: Text('author')),
                DataColumn(label: Text('image')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
