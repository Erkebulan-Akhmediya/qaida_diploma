import 'package:flutter/material.dart';
import 'package:qaida/components/interest_icon.dart';
import 'package:qaida/components/interest_subcategories.dart';
import 'package:qaida/components/interest_text.dart';

class InterestItem extends StatefulWidget {
  final String text;
  final List categories;

  const InterestItem({super.key, required this.text, required this.categories});

  @override
  State<StatefulWidget> createState() => _InterestItemState();
}

class _InterestItemState extends State<InterestItem> {
  bool _isSelected = false;
  bool _isOpen = false;

  void _changeSelect() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  void _changeOpen() {
    setState(() {
      _isOpen = !_isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: _isOpen ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: _changeOpen,
            child: InterestIcon(open: _isOpen,),
          ),
          GestureDetector(
            onTap: _changeSelect,
            child: _isOpen ?
              InterestSubcategories(
                text: widget.text,
                selected: _isSelected,
                categories: widget.categories,
              ) :
              InterestText(
                text: widget.text,
                selected: _isSelected,
              ),
          ),
        ],
      ),
    );
  }
}