import 'package:flutter/material.dart';
import 'package:test_shop_app/bottom_navigation/bottom_navigation.dart';
import 'package:test_shop_app/manage/static_method.dart';
import 'package:test_shop_app/values/strings.dart';
import 'package:velocity_x/velocity_x.dart';

class MyCart extends StatefulWidget {
  final List<dynamic> cartItems;

  const MyCart({Key? key, required this.cartItems}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  late final List<dynamic> cartItem;

  getSessionData() async {
    STM().checkInternet(context, widget).then((value) {
      if (value) {
        setState(() {
          cartItem = widget.cartItems;
        });

      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getSessionData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      body: cartItem.isEmpty
          ? Str().loading.text.bold.xl3.makeCentered()
          : ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cartItem[index]['title']),
                  subtitle: Text('Price: \$${cartItem[index]['price']}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      setState(() {
                        widget.cartItems.remove(cartItem);
                      });
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
          onPressed: () {
            cartItem.isEmpty
                ? showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Cart is empty!'),
                        content: const Text('Please add products to the cart.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  )
                : showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Order Placed'),
                        content: const Text(
                            'Your order has been placed successfully.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
          },
          child: const Text('Place Order'),
        ),
      ),
    );
  }
}
