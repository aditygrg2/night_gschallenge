import 'package:flutter/material.dart';
import 'package:night_gschallenge/providers/weather_provider.dart';
import 'package:night_gschallenge/widgets/UI/elevated_button_without_icon.dart';
import 'package:provider/provider.dart';

class TemperatureModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<WeatherProvider>(context).dataValue;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Container(
            height: 150,
            child: Image.asset(data['image']!),
          ),
          Text(
            data['heading']!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            data['subheading']!,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButtonWithoutIcon(
            text: 'Close',
            onPressedButton: () {
              // Provider.of<WeatherProvider>(context, listen: false)
              //     .stopRecorder();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
