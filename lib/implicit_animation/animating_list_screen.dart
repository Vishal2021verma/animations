import 'package:flutter/material.dart';

class AnimatingListScreen extends StatefulWidget {
  const AnimatingListScreen({super.key});

  @override
  State<AnimatingListScreen> createState() => _AnimatingListScreenState();
}

class _AnimatingListScreenState extends State<AnimatingListScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final listData = [
    UserModel(0, "Vishal", "Verma"),
    UserModel(1, "John", "Doe"),
    UserModel(2, "Jane", "Doe"),
    UserModel(3, "Alice", "Smoth"),
    UserModel(4, "Bob", "Smoth"),
    UserModel(5, "Charlie", "Smoth"),
  ];
  final initialListSize = 3;
  void addUser() {
    setState(() {
      var index = listData.length;
      listData.add(
        UserModel(++_maxIdValue, 'New', 'Person'),
      );
      _listKey.currentState!
          .insertItem(index, duration: const Duration(milliseconds: 300));
    });
  }

  void deleteUser(int id) {
    setState(() {
      final index = listData.indexWhere((u) => u.id == id);
      var user = listData.removeAt(index);
      _listKey.currentState!.removeItem(
        index,
        (context, animation) {
          return FadeTransition(
            opacity: CurvedAnimation(
                parent: animation, curve: const Interval(0.5, 1.0)),
            child: SizeTransition(
              sizeFactor: CurvedAnimation(
                  parent: animation, curve: const Interval(0.0, 1.0)),
              axisAlignment: 0.0,
              child: _buildItem(user),
            ),
          );
        },
        duration: const Duration(milliseconds: 600),
      );
    });
  }

  Widget _buildItem(UserModel user) {
    return ListTile(
      key: ValueKey<UserModel>(user),
      title: Text(user.firstName),
      subtitle: Text(user.lastName),
      leading: const CircleAvatar(child: Icon(Icons.person)),
      trailing: IconButton(
        onPressed: () => deleteUser(user.id),
        icon: const Icon(Icons.delete),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AnimatedList'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: addUser,
            ),
          ],
        ),
        body: SafeArea(
            child: AnimatedList(
          key: _listKey,
          initialItemCount: 5,
          
          itemBuilder:
              (BuildContext context, int index, Animation<double> animation) {
            return FadeTransition(
                opacity: animation, child: _buildItem(listData[index]));
          },
        )));
  }
}

class UserModel {
  UserModel(
    this.id,
    this.firstName,
    this.lastName,
  );

  final int id;
  final String firstName;
  final String lastName;
}

int _maxIdValue = 4;
