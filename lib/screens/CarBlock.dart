// @dart=2.9
import 'package:flutter/material.dart';
import 'package:lottie_animation/models/Car.dart';
import 'package:lottie_animation/models/Constants.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CarBlock extends StatelessWidget {
  CarBlock(this.car);
  final Car car;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(children: <Widget>[
        ListTile(
          title: Text('${car.Name} Car', style: kHeadingStyle),
          subtitle: Text(
            car.Model,
            style: TextStyle(
              color: greyColor,
            ),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Image(
              image: NetworkImage(car.Image),
              width: 70.0,
            ),
          ),
        ),
        CachedNetworkImage(
          imageUrl: car.Image,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Row(
          //Divider line
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                child: Divider(color: greyColor),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10.0, left: 20.0, right: 20.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: Text(
                        '${car.Price}',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Total',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}