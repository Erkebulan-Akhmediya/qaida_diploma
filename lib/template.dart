import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/categories/categories.dart';
import 'package:qaida/contacts/contacts.dart';
import 'package:qaida/main/main.dart';
import 'package:qaida/profile/profile.dart';
import 'package:qaida/providers/template.dart';

class Template extends StatelessWidget {
  const Template({super.key});

  @override
  Widget build(BuildContext context) {
    final templateProvider = context.watch<TemplateProvider>();
    String pageTitle = templateProvider.getTemplatePageTitle;
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: IndexedStack(
        index: templateProvider.templatePageIndex,
        children: const <Widget>[
          Main(),
          Categories(),
          Contacts(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: templateProvider.templatePageIndex,
        onTap: (index) {
          context.read<TemplateProvider>().changeTemplatePage(index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Категории',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Контакты',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}