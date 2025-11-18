String collselected = 'UPSU bears';
String colltitletext = '';

enum Collections{
  af(collname: 'Autumn favourites', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  bf(collname: 'black friday', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  c(collname: 'clothing', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  co(collname: 'clothing - original', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  ed(collname: 'elections discounts', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  er(collname: 'essential range', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  g(collname: 'graduation', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  leezh(collname: 'limited edition essential zip hoodies', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  m(collname: 'merchandise', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  nfc(collname: 'nike final chance', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  pe(collname: 'personalisation', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  po(collname: 'popular', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  pcc(collname: 'portsmouth city collection', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  pc(collname: 'pride collection', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  s(collname: 'sale', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  ser(collname: 'signiture & essential range', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  sr(collname: 'signiture range', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  sc(collname: 'sports clubs', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  sf(collname: 'Spring favourites', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  se(collname: 'student essentials', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  sg(collname: 'student groups', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  sess(collname: 'summer essentials', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  sfa(collname: 'summer favourites', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  uc(collname: 'university clothing', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  um(collname: 'university merchandise', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  ub(collname: 'UPSU bears', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  wf(collname: 'winter favourites', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498');

  const Collections({
    required this.collname,
    required this.displayurl,
  });

  final String collname;
  final String displayurl;
}