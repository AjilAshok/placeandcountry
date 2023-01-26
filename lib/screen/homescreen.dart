import 'dart:math';

import 'package:flutter/material.dart';
import 'package:machinetest/logic/homenotifer.dart';

import 'package:machinetest/model/placemodel.dart';

import 'package:machinetest/service/dataservice.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Homenotifeir>(context, listen: false).getAllList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    TextEditingController search = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Country and Place'),
      ),
      body: Consumer<Homenotifeir>(
        builder: (context, value, child) => Column(
          children: [
            TextFormField(
              controller: search,
              decoration: const InputDecoration(label: Text('Search.....')),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.list.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    color: Color.fromRGBO(random.nextInt(255),
                        random.nextInt(255), random.nextInt(255), 1),
                    child: ListTile(
                      title: Text(value.list[index].country),
                      subtitle: Text(value.list[index].place),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
