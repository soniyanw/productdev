import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:product_dev/models/products.dart';
import 'package:product_dev/services/service_imp.dart';
import 'package:product_dev/services/services.dart';
import 'package:product_dev/view_model/changes.dart';
import 'package:provider/provider.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  Future<void> updatecart() async {
    await context.read<MyModel>().getproducts();
  }

  @override
  void initState() {
    updatecart();
    setState(() {});
    updatecart();
    setState(() {}); // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SnackBar snackBar;
    Services imp = new ServiceImp();
    BuiltList<Products>? products = context.read<MyModel>().state.products;

    return WillPopScope(
      onWillPop: () {
        Future.delayed(Duration(seconds: 1)).then((_) {
          setState(() {
            print("updated");
            // Anything else you want
          });
        });
        //trigger leaving and use own data
        Navigator.pop(context, false);

        //we need to return a future
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Favorites'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return (products[index].fav == true)
                        ? Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
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
                                                  TextButton(
                                                      onPressed: () async {
                                                        imp.unlikeprod(
                                                            products[index]
                                                                    .id ??
                                                                0);
                                                        snackBar = SnackBar(
                                                          backgroundColor:
                                                              Colors.red,
                                                          content: Text(
                                                              '${products[index].name} removed form wishlist'),
                                                          duration: Duration(
                                                              seconds: 1),
                                                        );
                                                        await context
                                                            .read<MyModel>()
                                                            .getproducts();
                                                        setState(() {});
                                                        await context
                                                            .read<MyModel>()
                                                            .getproducts();
                                                        setState(() {});

                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                snackBar);
                                                      },
                                                      child: Text(
                                                        'Remove',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      )),
                                                  InkWell(
                                                    onTap: () {
                                                      if (products[index]
                                                              .cart ==
                                                          false) {
                                                        imp.updatecart(
                                                            products[index]
                                                                    .id ??
                                                                0);
                                                        snackBar = SnackBar(
                                                          backgroundColor:
                                                              Colors.green,
                                                          content: Text(
                                                              '${products[index].name} is added to cart'),
                                                          duration: Duration(
                                                              seconds: 1),
                                                        );
                                                      } else {
                                                        snackBar = SnackBar(
                                                          backgroundColor:
                                                              Colors.red,
                                                          content: Text(
                                                              '${products[index].name} is already in the cart'),
                                                          duration: Duration(
                                                              seconds: 1),
                                                        );
                                                      }

                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              snackBar);
                                                    },
                                                    child: Container(
                                                      height: 35,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: const Center(
                                                        child: Text(
                                                          'Add to cart',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
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
      ),
    );
  }
}
