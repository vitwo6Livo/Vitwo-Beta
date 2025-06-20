import 'package:flutter/material.dart';
import 'package:vitwo_beta/src/constants/colors.dart';

class RfqDetailsScreen extends StatelessWidget {
  const RfqDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'RFQ Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: GlobalColor.appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'RFQ Code: PR2506032/2',
              // style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8.0),
            Text(
              'PR Code: PR2506032',
              // style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Reference Number: MRP1749538707',
              // style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Expected Date: 04-06-2025',
              // style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Created By: Mamoon',
              // style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Closing Date: 04-06-2025',
              // style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Days Left: 5',
              // style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
