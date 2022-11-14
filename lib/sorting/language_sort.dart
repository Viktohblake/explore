import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class Sort {
//   static int ascendingSort(Country c1, Country c2) =>
//       c1.name!.common!.compareTo(c2.name!.common!);
// }

final List<String> languages = ['Bahasa', 'Deutsch', 'English',
  'Español', 'Française', 'Italiano', 'Português', 'Pу́сский',
  'Svenska', 'Türkçe', '普通话', 'بالعربية', 'বাঙ্গালী'];

class LanguageSort extends StatelessWidget {
  const LanguageSort({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _languageChoiceDialog(context),
    );
  }
}


_languageChoiceDialog(BuildContext context) => showDialog(
    context: context,
    builder: (context) {
      var _singleNotifier = Provider.of<SingleNotifier>(context);
      return AlertDialog(
          title: Text("Languages"),
          content: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: languages.map((e) => RadioListTile(
                  title: Text(e),
                  value: e,
                  groupValue: _singleNotifier.currentLanguage,
                  selected: _singleNotifier.currentLanguage == e,
                  onChanged: (value) {
                    if (value != _singleNotifier.currentLanguage) {
                      _singleNotifier.updateCountry(value);
                      Navigator.of(context).pop();
                    }
                  },
                ))
                    .toList(),
              ),
            ),
          ));
    });

class SingleNotifier extends ChangeNotifier {
  String _currentLanguage = languages[0];
  SingleNotifier();
  String get currentLanguage => _currentLanguage;
  updateCountry(value) {
    if (value != _currentLanguage) {
      _currentLanguage = value;
      notifyListeners();
    }
  }
}
