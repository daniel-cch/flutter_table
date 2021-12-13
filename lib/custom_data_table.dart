import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_table/scroll_controller_manager.dart';

class CustomDataTable extends StatefulWidget {
  const CustomDataTable({Key? key}) : super(key: key);

  @override
  State<CustomDataTable> createState() => _CustomDataTableState();
}

class _CustomDataTableState extends State<CustomDataTable> {
  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  ScrollControllerManager? _syncHorizontalScrollControllerManager;
  final FocusNode _focusNode = FocusNode();

  void _handleKeyEvent(RawKeyEvent event) {
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      var offset = _scrollController.offset;
      setState(() {
        if (kReleaseMode) {
          _scrollController.animateTo(
            offset - 50,
            duration: const Duration(milliseconds: 30),
            curve: Curves.ease,
          );
        } else {
          _scrollController.animateTo(
            offset - 50,
            duration: const Duration(milliseconds: 30),
            curve: Curves.ease,
          );
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      var offset = _scrollController.offset;
      setState(() {
        if (kReleaseMode) {
          _scrollController.animateTo(
            offset + 50,
            duration: const Duration(milliseconds: 30),
            curve: Curves.ease,
          );
        } else {
          _scrollController.animateTo(
            offset + 50,
            duration: const Duration(milliseconds: 30),
            curve: Curves.ease,
          );
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      var offset = _scrollController2.offset;
      setState(() {
        if (kReleaseMode) {
          _scrollController2.animateTo(
            offset - 20,
            duration: const Duration(milliseconds: 30),
            curve: Curves.ease,
          );
        } else {
          _scrollController2.animateTo(
            offset - 20,
            duration: const Duration(milliseconds: 30),
            curve: Curves.ease,
          );
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      var offset = _scrollController2.offset;
      setState(() {
        if (kReleaseMode) {
          _scrollController2.animateTo(
            offset + 20,
            duration: const Duration(milliseconds: 30),
            curve: Curves.ease,
          );
        } else {
          _scrollController2.animateTo(
            offset + 20,
            duration: const Duration(milliseconds: 30),
            curve: Curves.ease,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: _focusNode,
      onKey: _handleKeyEvent,
      child: Scrollbar(
        controller: _scrollController,
        isAlwaysShown: true,
        notificationPredicate: (ScrollNotification notification) {
          return notification.depth == 1;
        },
        child: Scrollbar(
          controller: _scrollController2,
          isAlwaysShown: true,
          notificationPredicate: (notification) {
            if (notification.depth == 0 &&
                notification.metrics.axis == Axis.horizontal) {
              return true;
            }

            return false;
          },
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              _syncHorizontalScrollControllerManager?.processNotification(
                scrollInfo,
                _scrollController2,
              );
              return false;
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: _scrollController2,
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Col1')),
                    DataColumn(label: Text('Col2')),
                    DataColumn(label: Text('Col3')),
                    DataColumn(label: Text('Col4')),
                    DataColumn(label: Text('Col5')),
                    DataColumn(label: Icon(Icons.person)),
                  ],
                  rows: _rows,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  final List<DataRow> _rows = const [
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
    DataRow(
      cells: [
        DataCell(Text("Data 1")),
        DataCell(Text("Data 2")),
        DataCell(Text("Data 3")),
        DataCell(Text("Data 4")),
        DataCell(Text("Data 5")),
        DataCell(Icon(Icons.person)),
      ],
    ),
  ];
}
