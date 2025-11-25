enum SortMenu{
  a(text: 'featured'),
  b(text: 'best selling'),
  f(text: 'high to low'),
  i(text: 'low to high');

  const SortMenu({
    required this.text,
  });

  final String text;
}