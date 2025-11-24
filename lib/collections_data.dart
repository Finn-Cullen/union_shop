String collselected = 'UPSU bears';
String colltitletext = '';

enum Collections{
  af(collname: 'Autumn favourites', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  bf(collname: 'black friday', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  ub(collname: 'UPSU bears', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498');

  const Collections({
    required this.collname,
    required this.displayurl,
  });

  final String collname;
  final String displayurl;
}