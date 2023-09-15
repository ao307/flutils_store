import 'package:flutils/features/home/presentation/widgets/title_text_home_colum.dart';
import 'package:flutter/material.dart';

/// string extensions
/// copy and paste this code in your project
/// you can use it anywhere you want
extension StringExtensions on String {
  /// capitalize first letter
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// capitalize first letter of each word
  String capitalizeWords() {
    return split(' ').map((str) => str.capitalize()).join(' ');
  }

  /// capitalize first letter of each sentence
  String capitalizeSentences() {
    return split('. ').map((str) => str.capitalize()).join('. ');
  }

  /// add space between each character
  String addSpaceBetweenCharacters() {
    return split('').join(' ');
  }

  // reverse string
  String reverse() {
    return split('').reversed.join();
  }

  /// remove all spaces
  String removeAllSpaces() {
    return replaceAll(' ', '');
  }

  /// remove all special characters
  String removeAllSpecialCharacters() {
    return replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  /// count of words without spaces
  int get wordCount {
    return split(' ').length;
  }

  /// count of characters without spaces
  int get characterCount {
    return removeAllSpaces().length;
  }

  /// count of lines
  int get lineCount {
    return split('\n').length;
  }

  /// is string is email
  bool get isEmail {
    return RegExp(r'^.+@[a-zA-Z]+\.[a-zA-Z]+(\.?[a-zA-Z]+)$').hasMatch(this);
  }
}

/// TitleTextColumn is a custom widget for showing title and text
/// you can make it easy and pass title and text to it
class StringExtensionsPage extends StatelessWidget {
  const StringExtensionsPage({super.key});

  static const wordsForTest =
      'lorem ipsum dolor sit amet. consectetur adipiscing elit.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // capitalize
          TitleTextColumn(
            text: 'Capitalize',
            child: wordsForTest.capitalize(),
          ),

          // capitalize words
          TitleTextColumn(
            text: 'Capitalize Words',
            child: wordsForTest.capitalizeWords(),
          ),

          // capitalize sentences
          TitleTextColumn(
            text: 'Capitalize Sentences',
            child: wordsForTest.capitalizeSentences(),
          ),

          // add space between characters
          TitleTextColumn(
            text: 'Add Space Between Characters',
            child: wordsForTest.addSpaceBetweenCharacters(),
          ),

          // reverse
          TitleTextColumn(
            text: 'Reverse',
            child: wordsForTest.reverse(),
          ),

          // remove all spaces
          TitleTextColumn(
            text: 'Remove All Spaces',
            child: wordsForTest.removeAllSpaces(),
          ),

          // remove all special characters
          TitleTextColumn(
            text: 'Remove All Special Characters',
            child: wordsForTest.removeAllSpecialCharacters(),
          ),

          // word count
          TitleTextColumn(
            text: 'Word Count',
            child: '${wordsForTest.wordCount}',
          ),

          // character count
          TitleTextColumn(
            text: 'Character Count',
            child: '${wordsForTest.characterCount}',
          ),

          // line count
          TitleTextColumn(
            text: 'Line Count',
            child: '${wordsForTest.lineCount}',
          ),

          // is email
          TitleTextColumn(
            text: 'Is Email',
            child:
                'Is aliashrafshahen@gmail.com email: ${'aliashrafshahen@gmail.com'.isEmail}',
          ),
        ],
      ),
    );
  }
}
