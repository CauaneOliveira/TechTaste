import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';
import 'package:myapp/model/restaurant.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:myapp/ui/_core/widgets/appbar.dart';
import 'package:provider/provider.dart';

class RestaurantScreen extends StatelessWidget {
  // Suggested code may be subject to a license. Learn more: ~LicenseLog:867600745.
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: restaurant.name),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            spacing: 30,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/${restaurant.imagePath}', width: 160),
              Padding(
                padding: EdgeInsets.all(14),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Os melhores pratos do ${restaurant.name}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Column(
                children: List.generate(restaurant.dishes.length, (index) {
                  Dish dish = restaurant.dishes[index];
                  return ListTile(
                    leading: Image.asset(
                      'assets/dishes/default.png',
                      width: 48,
                      height: 48,
                    ),
                    title: Text(dish.name),
                    subtitle: Text("R\$ ${dish.price.toStringAsFixed(2)}"),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<BagProvider>().addAllDishes([dish]);
                      },
                      icon: Icon(Icons.add),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
