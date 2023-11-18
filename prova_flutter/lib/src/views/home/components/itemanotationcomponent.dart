
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/src/views/home/controller/anotationcontroler.dart';

import '../controller/homecontroler.dart';

class ItemAnotationComponent extends StatelessWidget {
  const ItemAnotationComponent({
    super.key,
    required this.width,
    required this.anotationController,
    required this.homeController, required this.index,
  });

  final double width;
  final AnotationController anotationController;
  final HomeController homeController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        child: Column(
          children: [
            SizedBox(
              width: width * .8,
              child: Stack(
                children: [
                  Observer(builder: (context) {
                    return AnimatedContainer(
                      curve: Curves.easeInOut,
                      duration: const Duration(seconds: 1),
                      width: 240,
                      height: anotationController.anotation.isNotExpansed
                          ? 80
                          : 350,
                      child: InkWell(
                        onTap: anotationController.anotationChangeIsExpanded,
                        child: Text(
                          anotationController.anotation.text,
                          maxLines: anotationController.anotation.isNotExpansed
                              ? null
                              : 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  }),
                  Positioned(
                    right: 10,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: () =>
                                  homeController.switchMethodeForEdit(index),
                              child: const Icon(Icons.edit)),
                        ),
                        InkWell(
                          onTap: () => homeController
                              .showDeleteConfirmationDialog(context, index),
                          child: const Icon(
                            Icons.close_rounded,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
