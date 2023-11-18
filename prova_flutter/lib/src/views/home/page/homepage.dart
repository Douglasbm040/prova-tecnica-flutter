import 'package:flutter/material.dart';
import 'package:prova_flutter/src/custom/customtheme.dart';
import 'package:prova_flutter/src/views/home/controller/homecontroler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/src/views/shared/components/privacepolitictextcomponent.dart';

import '../controller/anotationcontroler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: CustomTheme.gradientColorBackground,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SafeArea(
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
                              itemBuilder: (context, index) {
                                final anotationController =
                                    homeController.items[index];
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
                                                  duration: const Duration(
                                                      seconds: 1),
                                                  width: 240,
                                                  height: anotationController
                                                          .anotation
                                                          .isNotExpansed
                                                      ? 80
                                                      : 350,
                                                  child: InkWell(
                                                    onTap: anotationController
                                                        .anotationChangeIsExpanded,
                                                    child: Text(
                                                      anotationController
                                                          .anotation.text,
                                                      maxLines:
                                                          anotationController
                                                                  .anotation
                                                                  .isNotExpansed
                                                              ? null
                                                              : 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                );
                                              }),
                                              Positioned(
                                                right: 10,
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: InkWell(
                                                          onTap: () =>
                                                              homeController
                                                                  .switchMethodeForEdit(
                                                                      index),
                                                          child: const Icon(
                                                              Icons.edit)),
                                                    ),
                                                    InkWell(
                                                      onTap: () => homeController
                                                          .showDeleteConfirmationDialog(
                                                              context, index),
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
                              });
                    }),
                  ),
                ),
              ),
              const SizedBox(
                height: 0,
              ),
              SizedBox(
                width: width * 0.8,
                child: TextField(
                  controller: homeController.textController,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    hintText: "Digite seu nome",
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.background,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onSubmitted: homeController.editAnotationText,
                ),
              ),
              PrivacePoliticTextComponent(
                redirect: () async {
                  homeController.redirectWeb();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
