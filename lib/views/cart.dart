import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:product_dev/view_model/changes.dart';
import 'package:provider/provider.dart';

import '../models/products.dart';
import '../services/service_imp.dart';
import '../services/services.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

int count = 1;

class _CartScreenState extends State<CartScreen> {
  Future<void> updatecart() async {
    await context.read<MyModel>().getproducts();
    setState(() {});
    await context.read<MyModel>().getproducts();
    setState(() {});
  }

  @override
  void initState() {
    updatecart();
    setState(() {}); // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BuiltList<Products>? products = context.read<MyModel>().state.products;
    SnackBar snackBar;
    Services imp = new ServiceImp();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return (products[index].cart == true)
                      ? Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image(
                                      height: 100,
                                      width: 100,
                                      image: NetworkImage(
                                          products[index].path.toString()),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            products[index].name.toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            products[index].unit.toString() +
                                                " " +
                                                r"Rs." +
                                                products[index]
                                                    .price
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Column(
                                              children: [
                                                MaterialButton(
                                                  onPressed: () {
                                                    showModalBottomSheet<void>(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return StatefulBuilder(
                                                              builder: (BuildContext
                                                                      context,
                                                                  StateSetter
                                                                      mystate) {
                                                            return Bottom(
                                                              name: products[
                                                                          index]
                                                                      .name ??
                                                                  '',
                                                              price: products[
                                                                      index]
                                                                  .price,
                                                            );
                                                          });
                                                        });
                                                  },
                                                  color: Colors.red,
                                                  child: Text(
                                                    "Buy",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      : Container();
                }),
          ),
        ],
      ),
    );
  }
}

class Bottom extends StatefulWidget {
  final name;
  final price;
  const Bottom({Key? key, this.name, this.price}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 400,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.name),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    if (count > 1) count--;
                    setState(() {});
                  },
                  color: Colors.red,
                  child: Text(
                    '-',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("$count"),
                ),
                MaterialButton(
                  onPressed: () {
                    count++;
                    setState(() {});
                  },
                  color: Colors.red,
                  child: Text(
                    '+',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Text("Rs.${int.parse(widget.price) * count}"),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Cost : $count ${widget.name} bought'),
                  duration: Duration(seconds: 1),
                ));
                count = 1;
                setState(() {});
              },
              color: Colors.red,
              child: Text(
                "Buy",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
