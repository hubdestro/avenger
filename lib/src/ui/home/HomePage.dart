import 'dart:io';

import 'package:avengers/src/providers/Status.dart';
import 'package:avengers/src/ui/Base.dart';
import 'package:avengers/src/ui/home/add/AddUserPage.dart';
import 'package:avengers/src/providers/UserProvider.dart';
import 'package:avengers/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChildState();
  }
}

class _ChildState extends BaseState<HomePage> {
  @override
  AppBar appBar() {
    return AppBar(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
      title: Text("Avengers"),
      actions: [
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              AppNavigation.push(context, AddUserPage());
            }),
        IconButton(icon: Icon(Icons.logout), onPressed: () {}),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).execute();
  }

  @override
  Widget contentView() {
    return Center(
      child: Consumer<UserProvider>(
        builder: (_, userProvider, child) {
          switch (userProvider.status) {

            case Status.Initial:
            case Status.Loading:
              return CircularProgressIndicator();

            case Status.Success:
              return ListView.builder(
                  itemCount: userProvider.userList().length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      background: Container(color: Colors.blueGrey[100]),
                      direction: DismissDirection.startToEnd,
                      confirmDismiss: (direction) {
                        return Future.value(false);
                      },
                      key: Key(index.toString()),
                      child: Card(
                        color: Colors.blueGrey[50],
                        child: ListTile(
                          contentPadding: EdgeInsets.all(8),
                          onTap: () {
                            AppAlert.snakeBar(context, "Clicked on item $index");
                          },
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                              "${userProvider.userList()[index].avatar}",
                            ),
                          ),
                          title: Text("${userProvider.userList()[index].firstName}"),
                          trailing: IconButton(
                            icon: Icon(Icons.more_horiz),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    );
                  });

            case Status.Error:
              return Text("Error occurred");
          }
          return Container();
        },
      ),
    );
  }
}
