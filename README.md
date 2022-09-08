First FoFa API Client With Dart

## Using

Just New A Fofa Class With You Fofa APi Key  And Fofa Email Then Use The function of this class, Below This Sample is Get User Info

```dart
import 'package:fofa/fofa.dart';

void main(List<String> args) async {
  Fofa fofa = new Fofa("xxx", "xxx@xx.xx");
  var result = await fofa.MyInfo();
  print(result);
}
```

The Function to Get Search Data By Fofa Query

```dart
import 'package:fofa/fofa.dart';

void main(List<String> args) async {
  Fofa fofa = new Fofa("xxx", "xxx@xx.xx");
  var result = await fofa.SearchAll("app=\"Apache-shifo\"");
  print(result);
}
```

The Function to Get Search Stats By Fofa Query

```dart
import 'package:fofa/fofa.dart';

void main(List<String> args) async {
  Fofa fofa = new Fofa("xxx", "xxx@xx.xx");
  var result = await fofa.SearchStats("app=\"Apache-shifo\"");
  print(result);
}
```

The Function to Get Host Detail By A Host Prama

```dart
import 'package:fofa/fofa.dart';

void main(List<String> args) async {
  Fofa fofa = new Fofa("xxx", "xxx@xx.xx");
  var result = await fofa.HostDetail("xxx.xxx.xxx.xxx");
  print(result);
}
```

There Have Many Prama Of Each Function Include Query,Host,Page,Size,Full,Fields,You Can See FOFA API Document To Know The Usage

| Prama  | Mean                                                         |                           |
| ------ | ------------------------------------------------------------ | ------------------------- |
| Query  | Prama of Function SearchAll And SearchStats Example:app="Apache-Shirt" | require                   |
| Host   | Prama of Function HostDetail                                 | require                   |
| Page   | Prama of Function SearchAll                                  | optional ,default is 1    |
| Size   | Prama of Function SearchAll                                  | optional ,default is 100  |
| Full   | Prama of Function SearchAll                                  | optional,default is false |
| Fields | Prama of Function SearchAll                                  | default is host,ip,port   |
| Detail | Prama of Function HostDetail                                 | optional,default is false |



