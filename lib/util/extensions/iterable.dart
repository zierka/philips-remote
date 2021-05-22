import 'package:collection/collection.dart';

extension IterableExtensions<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E) test) {
    for (E element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  bool containsWhere(bool Function(E) test) {
    for (E element in this) {
      if (test(element)) return true;
    }
    return false;
  }

  bool sameAs(List<E> secondList) {
    return ListEquality().equals(this.toList(), secondList);
  }
}
