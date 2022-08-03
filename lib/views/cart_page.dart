import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/model/carts/cart.dart';
import 'package:firebase_sample/services/api_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Cart>? cart;
  var isLoaded = false;
  final ScrollController _controller = ScrollController();
  final double _height = 300;

  void _animateToIndex(index) {
    _controller.animateTo(
      index * _height,
      duration: Duration(seconds: 2),
      curve: Curves.ease,
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    cart = (await getCart());
    print("cart count in ${cart!.length}");
    if (cart != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text(user.email!),
        backgroundColor: Colors.teal,
        actions: [
          TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Visibility(
        visible: isLoaded,
        // ignore: sort_child_properties_last
        child: ListView.builder(
          controller: _controller,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          itemCount: cart?.length,
          itemBuilder: (context, index) {
            // cart items
            var cartItems = cart?[index];
            var products = cartItems?.products;

            return Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.teal,
                  )),
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Cart No : ${cart![index].id.toString()}",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: products!.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(
                          products[index].title.toString(),
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        subtitle: Text(
                          products[index].price.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _bottomSheet();
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.navigation),
      ),
    );
  }

  _bottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height / 2,
          child: ListView.builder(
              controller: _controller,
              shrinkWrap: true,
              itemCount: cart?.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pop(context);

                    _animateToIndex(cart![index].id! - 1);
                  },
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(cart![index].id.toString()),
                      ),
                      Divider(
                        color: Colors.teal,
                      ),
                    ],
                  ),
                );
              }),
        );
      },
    );
  }
}
