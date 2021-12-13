import 'package:flutter/material.dart';
import 'package:flutter_table/custom_data_table.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 200,
            color: Colors.redAccent,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeBottom: true,
                    removeTop: true,
                    child: const CustomDataTable(),
                  ),
                ),
                Container(
                  color: Colors.pink,
                  height: 40,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
