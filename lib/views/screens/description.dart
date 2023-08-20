import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/product.dart';

class Description extends StatefulWidget {
  const Description({Key? key, required this.product, required this.index})
      : super(key: key);
  final Product product;
  final int index;

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int itemIndex;
    Product product;
    return Scaffold(
      backgroundColor: Color.fromARGB(161, 255, 153, 0),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Back',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: size.width * 0.8,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: size.width * 0.7,
                          width: size.width * .7,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Center(
                          child: Image.asset(
                            widget.product.image,
                            height: size.width * 0.75,
                            width: size.width * 0.75,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                  //title
                  Text(
                    widget.product.title,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //price
                  Text(
                    'price : ${widget.product.price}\$',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            //text description
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  child: Text(
                    widget.product.description,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
