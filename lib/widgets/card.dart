import 'package:flutter/material.dart';

import '../core/constants/url.dart';
import '../models/currency_model.dart';

class ItemCard extends StatelessWidget {
  ItemCard({Key? key, required this.currencyModel}) : super(key: key);

  CurrencyModel currencyModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                "${UrlConst.imageUrl}${currencyModel.code![0]}${currencyModel.code![1]}"),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currencyModel.code!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Text(
                "1 ${currencyModel.title}",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currencyModel.cbPrice!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "2.96%",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
