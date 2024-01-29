import 'package:flutter/material.dart';

class AZScrollList extends StatefulWidget {
  const AZScrollList({super.key});

  @override
  State<AZScrollList> createState() => _AZScrollListState();
}

class _AZScrollListState extends State<AZScrollList> {
  final List<String> items = [
    'Apple',
    'Apricot',
    'Avocado',
    'Banana',
    'Blackberry',
    'Blueberry',
    'Boysenberry',
    'Cherry',
    'Coconut',
    'Cranberry',
    'Date',
    'Dragon fruit',
    'Duran',
    'Elderberry',
    'Egg fruit',
    'Fig',
    'Goji berry',
    'Gooseberry',
    'Grape',
    'Guava',
    'Honey berry',
    'Huckleberry',
    'Jabuticaba',
    'Jackfruit',
    'Jambul',
    'Japanese plum',
    'Jostaberry',
    'Jujube',
    'Juniper berry',
    'Kiwano',
    'Kiwifruit',
    'Kumquat',
    'Lemon',
    'Lime',
    'Loquat',
    'Longan',
    'Lychee',
    'Mango',
    'Mangosteen',
    'Marionberry',
    'Melon',
    'Miracle fruit',
    'Mulberry',
    'Nance',
    'Nectarine',
    'Olive',
    'Orange',
    'Papaya',
    'Passionfruit',
    'Peach',
    'Pear',
    'Persimmon',
    'Pineapple',
    'Pineberry',
    'Plum',
    'Pomegranate',
    'Pomelo',
    'Purple mangosteen',
    'Quince',
    'Raspberry',
    'Rambutan',
    'Redcurrant',
    'Salal berry',
    'Salmonberry',
    'Satsuma',
    'Soursop',
    'Star apple',
    'Star fruit',
    'Strawberry',
    'Surinam cherry',
    'Tamarillo',
    'Tamarind',
    'Tangerine',
    'Ugli fruit',
    'White currant',
    'White sapote',
    'Yuzu',
    'Ziziphus mauritiana',
    'Zuchinni',
    'Zig zag vine',
    'Zinfandel grape',
  ];

  final List<String> letters = [
    '#',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  ];

  final ScrollController _scrollController = ScrollController();

  String selectedLetter = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 24.0,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: letters.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedLetter = letters[index];
                    });
                    _scrollToIndex(index);
                  },
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(
                      top: 4.0,
                      bottom: 4.0,
                    ),
                    alignment: Alignment.center,
                    height: 24.0,
                    decoration: BoxDecoration(
                      color: selectedLetter == letters[index]
                          ? Colors.purple
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      letters[index],
                      style: TextStyle(
                        fontWeight: selectedLetter == letters[index]
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                if (selectedLetter.isNotEmpty &&
                    !items[index].startsWith(selectedLetter)) {
                  return const SizedBox.shrink();
                }
                return ListTile(
                  title: Text(items[index]),
                  onTap: () {
                    // Do something when the tile is tapped
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _scrollToIndex(int index) {
    _scrollController.animateTo(
      index * 24.0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}
