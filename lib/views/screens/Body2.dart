import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/Models/Todo_model.dart';
import 'package:flutter_application_1/Service/Task_service.dart';
import 'package:flutter_application_1/views/cubit/todo_cubit.dart';
import 'package:flutter_application_1/views/screens/description.dart';
import 'package:flutter_application_1/views/screens/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body2 extends StatefulWidget {
  @override
  State<Body2> createState() => _Body2State();
}

class _Body2State extends State<Body2> {
  /* List<TodoModel> Tasks = [];
  getMyTasks() async {
    Tasks = await Task_service().getTasks();
  }*/

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Product product;
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: BlocConsumer<TodoCubit, TodoState>(
        builder: (context, State) {
          if (State is TaskLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (State is TaskError) {
            return Center(
              child: Text("Error"),
            );
          } else {
            return Scaffold(
              backgroundColor: Color.fromARGB(161, 255, 153, 0),
              body: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    // big stack
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 70),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                        ),
                        ListView.builder(
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              product = products[index];

                              return Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                height: 250,
                                // stack 2
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Description(
                                          product: products[index],
                                          index: index,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 200,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(22),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(0, 15),
                                                  blurRadius: 25,
                                                  color: Colors.black12)
                                            ]),
                                      ),
                                      // image
                                      Positioned(
                                          top: 0.0,
                                          left: 0.0,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            height: 160,
                                            width: 200,
                                            child: Image.asset(
                                              product.image,
                                              fit: BoxFit.cover,
                                            ),
                                          )),

                                      Positioned(
                                          bottom: 0.0,
                                          right: 0.0,
                                          top: 10.0,
                                          child: SizedBox(
                                            height: 136,
                                            width: size.width - 200,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                // title
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20),
                                                  child: Text(
                                                    product.title,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                //subtitle
                                                Text(
                                                  product.subtitle,
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                // price
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.orange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            22),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 30,
                                                      vertical: 5,
                                                    ),
                                                    child: Text(
                                                      'price :${product.price}\$',
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                ],
              ),
            );
            ;
          }
        },
        listener: (context, State) {},
      ),
    );
  }
}
