import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '随机座位生成器',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(129, 41, 31, 1),
        ),
        fontFamily: 'Microsoft Yahei',
      ),
      home: RandomSeatPage(),
    );
  }
}

class RandomSeatPage extends StatefulWidget {
  const RandomSeatPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RandomSeatPageState createState() => _RandomSeatPageState();
}

class _RandomSeatPageState extends State<RandomSeatPage> {
  final int cols = 5; // 列数
  List<String> seats = [];

  void generateRandomSeats({int? seed}) {
    // final total = 33;
    List<String> newSeats = [
      "高晨恩",
      "黄俊杰",
      "吴昔遥",
      "周政伟",
      "周煜钦",
      "曹桓毓",
      "肖杰元",
      "禹常涵",
      "陈星宏",
      "唐浩然",
      "张涵峤",
      "谭正屹",
      "张颢严",
      "王宸奥",
      "李思齐",
      "胡苏寒",
      "谢美琳",
      "刘哲佚",
      "陈墨轩",
      "薛睿涵",
      "吕品睿",
      "刘子杨",
      "陆思齐",
      "杨卓航",
      "唐慎谦",
      "叶凌僖",
      "陈宇坤",
      "陈柯霖",
      "刘奕铭",
      "钟杨振飞",
      "唐胡元",
      "黄文杰",
      "谢自均",
    ];

    Random rng = seed != null ? Random(seed) : Random();
    newSeats.shuffle(rng);

    setState(() {
      seats = newSeats;
    });
  }

  @override
  void initState() {
    super.initState();
    generateRandomSeats(); // 页面初始化时生成一次
  }

  // int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double gridHeight = MediaQuery.of(context).size.height;
    double itemHeight =
        (gridHeight -
            (8 * 10) -
            MediaQuery.of(context).size.height * 0.02 -
            150) /
        8; // 13 行，2 为间距

    double gridWidth = MediaQuery.of(context).size.width / 9 * 8;
    double itemWidth =
        (gridWidth - (5 * 8) - MediaQuery.of(context).size.width * 0.02) / 6;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '随机座位分配',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Row(
        children: [
          // 左侧侧边栏
          // NavigationRail(
          //   selectedIndex: _currentIndex,
          //   onDestinationSelected: (int index) {
          //     setState(() {
          //       _currentIndex = index;
          //     });
          //   },
          //   labelType: NavigationRailLabelType.all,
          //   destinations: const [
          //     NavigationRailDestination(
          //       icon: Icon(Icons.book),
          //       label: Text('608'),
          //     ),
          //     NavigationRailDestination(
          //       icon: Icon(Icons.book),
          //       label: Text('609'),
          //     ),
          //   ],
          // ),

          // Expanded(
          //   child: seats.isEmpty
          //       ? Center(child: Text('未生成座位'))
          //       : switch (_currentIndex) {
          //           0 => Page(
          //             cols: cols,
          //             itemWidth: itemWidth,
          //             itemHeight: itemHeight,
          //             seats: seats.sublist(0, 36), // 前 36 个座位
          //           ),
          //           1 => Page(
          //             cols: cols,
          //             itemWidth: itemWidth,
          //             itemHeight: itemHeight,
          //             seats: seats.sublist(36, 73), // 后 37 个座位
          //           ),
          //           _ => throw UnimplementedError(),
          //         },
          // ),
          Expanded(
            flex: 8,
            child: seats.isEmpty
                ? Center(child: Text('未生成座位'))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Builder(
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.01),
                            child: Center(
                              child: Text(
                                "讲台",
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      // Builder(
                      //   builder: (context) {
                      //     return Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: w * 0.01),
                      //       child: Text(
                      //         "前门",
                      //         textAlign: TextAlign.right,
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //           color: Theme.of(context).colorScheme.secondary,
                      //         ),
                      //       ),
                      //     );
                      //   },
                      // ),
                      Page(
                        cols: cols,
                        itemWidth: itemWidth,
                        itemHeight: itemHeight,
                        seats: seats.sublist(0, 33), // 前 36 个座位
                      ),
                      // Builder(
                      //   builder: (context) {
                      //     return Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: w * 0.01),
                      //       child: Text(
                      //         "后门",
                      //         textAlign: TextAlign.right,
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //           color: Theme.of(context).colorScheme.secondary,
                      //         ),
                      //       ),
                      //     );
                      //   },
                      // ),
                      // Builder(
                      //   builder: (context) {
                      //     return Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: w * 0.01),
                      //       child: Text(
                      //         "609 讲台",
                      //         style: TextStyle(
                      //           color: Theme.of(context).colorScheme.secondary,
                      //           fontSize: 24,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     );
                      //   },
                      // ),
                      // Builder(
                      //   builder: (context) {
                      //     return Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: w * 0.01),
                      //       child: Text(
                      //         "前门",
                      //         textAlign: TextAlign.right,
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //           color: Theme.of(context).colorScheme.secondary,
                      //         ),
                      //       ),
                      //     );
                      //   },
                      // ),
                      //   Page(
                      //     cols: cols,
                      //     itemWidth: itemWidth,
                      //     itemHeight: itemHeight,
                      //     seats: seats.sublist(36, 73), // 后 37 个座位
                      //   ),
                      //   Builder(
                      //     builder: (context) {
                      //       return Padding(
                      //         padding: EdgeInsets.symmetric(horizontal: w * 0.01),
                      //         child: Text(
                      //           "后门",
                      //           textAlign: TextAlign.right,
                      //           style: TextStyle(
                      //             fontSize: 16,
                      //             color: Theme.of(context).colorScheme.secondary,
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //   ),
                    ],
                  ),
          ),

          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () => generateRandomSeats(),
                icon: Icon(Icons.shuffle),
                label: Text('重新生成'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Page extends StatelessWidget {
  const Page({
    super.key,
    required this.cols,
    required this.itemWidth,
    required this.itemHeight,
    required this.seats,
  });

  final int cols;
  final double itemWidth;
  final double itemHeight;
  final List<String> seats;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height + 100,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.01,
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      alignment: Alignment.center,
      child: GridView.count(
        crossAxisCount: cols,

        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(), // 禁止滚动
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,

        childAspectRatio: itemWidth / itemHeight,
        children: seats.map((number) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Text(
              number,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 20,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
