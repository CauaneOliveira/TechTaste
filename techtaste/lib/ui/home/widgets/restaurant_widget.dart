import 'package:flutter/material.dart';
import 'package:myapp/model/restaurant.dart';
import 'package:myapp/ui/restaurants/restaurant_screen.dart';

class restaurantWidget extends StatelessWidget {
  final Restaurant restaurant;
  // Suggested code may be subject to a license. Learn more: ~LicenseLog:740383009.
  // Suggested code may be subject to a license. Learn more: ~LicenseLog:1791825600.
  const restaurantWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return RestaurantScreen(restaurant: restaurant);
            },
          ),
        );
      },
      child: Row(
        spacing: 12,
        children: [
          Image.asset('assets/${restaurant.imagePath}', height: 90),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: List.generate(restaurant.stars.toInt(), (index) {
                  return Icon(Icons.star, color: Colors.amber, weight: 16);
                }),
              ),
              Text('${restaurant.distance}km'),
            ],
          ),
        ],
      ),
    );
  }
}
