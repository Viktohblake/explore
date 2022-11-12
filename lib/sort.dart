import 'package:explore/model/country_model.dart';

class Sort {
  static int ascendingSort(Country c1, Country c2) =>
      c1.name!.common!.compareTo(c2.name!.common!);
}
