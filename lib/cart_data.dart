List<CartItem> cartlist = [const CartItem(name: 'agawa',cost:  '14',url:  'mondays'),const CartItem(name: 'agaw',cost:  '14',url:  'mondays')];

class CartItem{
  final String name;  
  final String cost;
  final String url;

  const CartItem({required this.name,required this.cost,required this.url});
}