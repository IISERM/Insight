## Routing
We use [Auto Router]() for our routing needs.\
Useful links are attached here:
- [Pub Dev Page](https://pub.dev/packages/auto_route): This contains all the basic examples, and is a must read for the first time users.
- [API Reference](https://pub.dev/documentation/auto_route/latest/): This is the api reference, please check the auto_route library on the left and not the anotations one.

## Quick Introduction
Every page on the app is a widget(more specifically its either a ConsumerWidget or a ConsumerStatefulWidget as most pages will need Riverpod). AutoRoute allows us to route to any page by defining a route.\
Imagine that the user of the of app is a letter. In order for the letter to go from place A to place B, place A and B need to have defined addresses.

Also yes, as the previous paragraph suggested; we can route to any widget. Nothing makes a `Page` widget special.

### Generate the route for a page(widget)
The steps to define an address is trivial.
```dart
@RoutePage()    
class HomePage extends ConsumerWidget {}
```
Add the `@RoutePage()` line on top of the class where the main widget is defined. Any one liner that starts with `@` is called an annotation.\

By default the name of the route is going to be the name of the class except if it finds `Page` it will replace it with `Route`.\
Example:
- `HomePage`: `HomeRoute`
- `PageThisStringContainsTheWordPage`: `RouteThisStringContainsTheWordRoute`
- `NoReplacing`: `NoReplacing`
In the last scenario it might sometimes be inconvinent to understand the difference between `NoReplacing`(the class) and `NoReplacing`(the route).\
So instead in these cases to avoid ambiguity, it is recommended to add a custom route name manually to something which is identfiable as a route. We can do so by:
```dart
@RoutePage(name: "AuthCheckerRoute")
class AuthChecker extends ConsumerWidget {}
```

After doing this, please run the following command in your terminal window.\
```
flutter packages pub run build_runner build
```

Once the command is done, please open `router_config.dart` located in `lib/config/routes/router_config.dart`.\
In this file we have `List<AutoRoute> get routes`; in that list. Please create a new entry with the name of the route you just generated.

Assume you were working on a page with the class named as `DocumentationPage`. The default route generated would be `DocumentationRoute`. So you need to add `AutoRoute(page: DocumentationRoute.page, path: "/documentation"),` to the list. (Please do not forget the "," as its important for styling).
```dart
List<AutoRoute> get routes =>
      [
        // Some paths will already be here, add your path onto them.
        AutoRoute(page: HomeRoute.page, path: "/home"),
        AutoRoute(page: DocumentationRoute.page, path:"/documentation"),
      ];
```

### Routing to a page
Get the scoped router by calling `AutoRouter.of(context)` or simply by using `context.router`.

If you want to go some specific page, you can either do so by calling a new instance of their Route or by using their Path.
```dart
context.router.push(const HomeRoute());
// or
context.router.pushNamed("/home");
```

If you wish to navigate to the previous page.
```dart
context.router.navigateBack();
```

If you want to navigate to a widget that needs to get some information.
```dart
@RoutePage
class SRMDetailsPage extends ConsumerWidget {
    const SRMDetailsPage({required this.registrationNumber});
    final String registrationNumber;
    // Any default value set to this will be respected
}
```

In order to route to this page and pass it the registrationNumber, we can use:
```dart
String regNo = "MS22174";
context.router.push(SRMDetailsRoute(registrationNumber: regNo));
```
We can also do this routing using path by routing using path parameters, for which please check the documentation. Please try to avoid this method of passing parameters unless necessary and fetch information from `Hive`(our local database).
