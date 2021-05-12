import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/orders.dart';

class OrdersButton extends StatefulWidget {
  const OrdersButton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  _OrdersButtonState createState() => _OrdersButtonState();
}

class _OrdersButtonState extends State<OrdersButton> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: _isLoading
          ? CircularProgressIndicator()
          : Text(
              'COMPRAR',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
      onPressed: widget.cart.totalAmount == 0
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });
              await Provider.of<Orders>(context, listen: false)
                  .addOrder(widget.cart);
              setState(() {
                _isLoading = false;
              });
              widget.cart.clear();
            },
    );
  }
}
