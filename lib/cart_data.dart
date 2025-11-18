List<CartItem> cartlist = [CartItem('agawa', '14', 'mondays'),CartItem('agawa', '14', 'mondays'),CartItem('agawa', '14', 'mondays')];

class CartItem{
  final String name;
  final String cost;
  final String url;

  const CartItem(this.name, this.cost, this.url);
}