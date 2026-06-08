class Adhkar {
  final String category;
  final List<DhikrItem> items;

  Adhkar({required this.category, required this.items});
}

class DhikrItem {
  final String text;
  final String count;
  final String benefit;

  DhikrItem({required this.text, required this.count, required this.benefit});
}

final List<Adhkar> adhkarList = [
  Adhkar(
    category: "أذكار الصباح",
    items: [
      DhikrItem(text: "أصبحنا وأصبح الملك لله", count: "1", benefit: "من قالها حين يصبح أجير من الجن حتى يمسي"),
      DhikrItem(text: "اللهم بك أصبحنا وبك أمسينا", count: "1", benefit: "سنة عن النبي صلى الله عليه وسلم"),
    ],
  ),
  Adhkar(
    category: "أذكار المساء",
    items: [
      DhikrItem(text: "أمسينا وأمسى الملك لله", count: "1", benefit: "من قالها حين يمسي أجير من الجن حتى يصبح"),
    ],
  ),
];
