import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/widgets/cart_item_widget.dart';
import 'package:shop/widgets/orders_buttom.dart';
import '../providers/cart.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final cartItems = cart.items.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(25),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 10),
                  Chip(
                    label: Text(
                      'R\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline6
                              .color),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  Spacer(),
                  OrdersButton(cart: cart),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.only(
              left: 18,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              'No seu carrinho',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemsCount,
              itemBuilder: (ctx, i) => CartItemWidget(cartItems[i]),
            ),
          ),
        ],
      ),
    );
  }
}
