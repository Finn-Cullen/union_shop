enum FilterMenu {
  product(text: 'products'),
  clothing(text: 'clothing'),
  merch(text: 'merch'),
  psut(text: 'PSUT');

  const FilterMenu({
    required this.text,
  });

  final String text;
}