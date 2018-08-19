import 'package:angular/angular.dart';
import 'package:web_app/app_component.template.dart' as ng;
import 'package:web_app/src/dependency_injection.dart' as di;

void main() {
  di.WInjector.configure(di.Flavor.PROD);
  runApp(ng.AppComponentNgFactory);
}
