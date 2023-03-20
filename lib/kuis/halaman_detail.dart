import 'package:flutter/material.dart';
import 'rental_car.dart';

class HalamanDetail extends StatefulWidget {
  final RentalCar car;
  const HalamanDetail({Key? key, required this.car}) : super(key: key);

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(widget.car.brand + ' ' + widget.car.model),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.car.images.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Image.network(widget.car.images[index]),
                        );
                      },
                      pageSnapping: true,
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    '${widget.car.brand} ${widget.car.model}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Text('Brand                 : ' + widget.car.brand),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Text('Model                : ' + widget.car.model),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Text('Tahun                : ' + widget.car.year.toString()),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Text('Biaya Sewa       : ' + widget.car.rentalPricePerDay),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Row(
                          children: [
                            Text(
                              'Status                : ',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              widget.car.available ? 'Tersedia' : 'Tidak Tersedia',
                              style: TextStyle(
                                color: widget.car.available ? Colors.green : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  width: 0.95 * MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: widget.car.available
                        ? () {
                      setState(() {
                        widget.car.available = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Berhasil Memesan'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                        : null,
                    child: Text(widget.car.available ? 'Pesan' : 'Pesan'),
                    style: ElevatedButton.styleFrom(
                      primary: widget.car.available ? Colors.blue : Colors.grey,
                      textStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Deskripsi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(widget.car.description),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ],
            )
        )
    ));
  }
}
