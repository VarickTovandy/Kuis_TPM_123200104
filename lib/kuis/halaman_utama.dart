import 'package:flutter/material.dart';

import 'halaman_detail.dart';
import 'rental_car.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Rental Mobil'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: rentalCar.length,
          itemBuilder: (context, index) {
            final RentalCar place = rentalCar[index];
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HalamanDetail(car: place),
                  ),
                );
              },
              leading: SizedBox(
                height: 250,
                width: 150,
                child: Image.network(
                  place.images[0],
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(place.brand),
              subtitle: Text(place.rentalPricePerDay + "/hari"),
            );
          },
        ),
      ),
    );
  }
}
