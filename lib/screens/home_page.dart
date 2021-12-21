import 'package:dars77_provider_with_traffick_lights/model/list.dart';
import 'package:dars77_provider_with_traffick_lights/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Visibility(
            visible:
                context.watch<HomeProvider>().myList.isEmpty ? false : true,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child:
                  Text(context.watch<HomeProvider>().myList.length.toString()),
            ),
          ),
        ),
        backgroundColor: context.watch<HomeProvider>().colorOfAppBar,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Form(
              key: context.watch<HomeProvider>().formKey,
              child: Column(
                children: [
                  Card(
                    child: ListTile(
                      leading: DropdownButton(
                        items: const [
                          DropdownMenuItem(
                            child: CircleAvatar(backgroundColor: Colors.red),
                            value: "red",
                          ),
                          DropdownMenuItem(
                              child:
                                  CircleAvatar(backgroundColor: Colors.yellow),
                              value: "yellow"),
                          DropdownMenuItem(
                              child:
                                  CircleAvatar(backgroundColor: Colors.green),
                              value: "green"),
                        ],
                        value: context.watch<HomeProvider>().valueOfColor,
                        onChanged: (String? color) {
                          context.read<HomeProvider>().changeColor(color!);
                        },
                      ),
                      title: TextFormField(
                        controller:
                            context.watch<HomeProvider>().textController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Text here..."),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? "Bo'sh qoldirilmasin" : null,
                      ),
                      trailing: InkWell(
                        child: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 40,
                        ),
                        onTap: () {
                          context.read<HomeProvider>().addToList(
                                MyList(
                                  Provider.of<HomeProvider>(
                                    context,
                                    listen: false,
                                  ).colorOfAppBar,
                                  Provider.of<HomeProvider>(
                                    context,
                                    listen: false,
                                  ).textController.text,
                                ),
                              );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: ListView.builder(
              itemBuilder: (_, __) => ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      context.watch<HomeProvider>().myList[__].color,
                ),
                title: Text(
                  context.watch<HomeProvider>().myList[__].title,
                ),
              ),
              itemCount: context.watch<HomeProvider>().myList.length,
            ),
          ),
        ],
      ),
    );
  }
}
