
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/src/views/home/components/itemanotationcomponent.dart';
import 'package:prova_flutter/src/views/home/controller/homecontroler.dart';
import 'package:prova_flutter/src/views/home/page/homepage.dart';

class ListAnotationComponent extends StatelessWidget {
  const ListAnotationComponent({
    super.key,
    required this.width,
    required this.height,
    required this.homeController,
  });

  final double width;
  final double height;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        child: SizedBox(
          width: width * .8,
          height: height * .55,
          child: Observer(builder: (context) {
            return homeController.items.isEmpty
                ? const Center(
                    child: Text(
                        "Você ainda não adicionou anotações"),
                  )
                : ListView.builder(
                    itemCount: homeController.items.length,
                    itemBuilder: (context, position) {
                      final anotationController =
                          homeController.items[position];
                      return ItemAnotationComponent(
                          width: width,
                          index: position,
                          anotationController: anotationController,
                          homeController: homeController);
                    });
          }),
        ),
      ),
    );
  }
}