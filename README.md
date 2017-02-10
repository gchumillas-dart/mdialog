# mdialog

A minimalist modal dialog system.

## Usage

A simple usage example:

```dart
import 'package:mdialog/mdialog.dart';

main() async {
  await alert('We will proceed to format the Hard Disk');
  print('Ok, you\'ve been alerted');

  if (await confirm('Are you sure?')) {
    print('Formating Hard Disk ...');
  }
}
```

## Features and bugs

Please file feature requests and bugs at the [Issue Tracker](https://github.com/gchumillas-dart/mdialog/issues)
