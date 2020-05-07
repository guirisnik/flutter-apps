# clima

Clima is an app that shows the weather conditions either using the device's location or by typing the desired location into it.

## Topics

Topics in this project include:

- Flutter:
  - geolocator package;
  - Stateful widget lifecycle;
  - Networking and requests (HTTP package);
- Dart:
  - Futures, Async and Await;
  - Exceptions and Null aware operator;
  - Parsing;

## Flutter

### gelocator package

https://pub.dev/packages/geolocator#-readme-tab-

### Stateful widget lifecycle

In opposition to Stateless widgets, which only have a build method, __Stateful__ widgets have a state property, which makes so that these have three distinct stages in an app:

- initState - before the widget builds;
- build;
- dispose - after the widget is destroyed;

Not only that, but the build stage brings with it two more possible stages which are:

- setState;
- didUpdateConfig;

because of its nature of rebuilding the widget every time the state gets an update.

## Dart

### Futures, Async and Await

Async / Await are keywords used to tag functions and returns in order to, in a sense, transform asynchronous responses into synchronous.

What it does is tell the stack that a certain function should be run asynchronously, i.e., it should not wait for every response to return before executing the rest of the stack __unless__ explicitly declared that certain operation should be waited, in which case the return given is a __Future__.

A Future is like a voucher that you get when calling a certain function or operation. This voucher has an identification number and, when this number is called to receive whatever it is the voucher is supposed to receive, then it resolves to something.

### Exceptions and Null aware operator

Suppose your app asks the user for an input, perhaps a number that will be used as margin for the next route shown, but that input is not strongly required for the user to continue on to the next route.

On that case, if the user does not provide a value, you can't simply ignore it when building the widget for the next route, you have to have a backup, a way to handle the lack of this value.

```dart
Class SomeRoute extends StatelessWidget {
  String userProvidedMargin;

  SomeRoute({ this.userProvidedMargin });

  Widget build(BuildContext context) {
    double marginAsDouble;

    try {
      marginAsDouble = double.parse(userProvidedMargin);
    } catch (e) {
      print(e);
    }

    return Scaffold(
      body: Container(
        color: Colors.red,
        margin: EdgeInsets.all(marginAsDouble ?? 30.0),
      ),
    );
  }
}
```

Here, in case the user does not provide a value to be used as margin, we're handling the exception raised by the `parse` method from `double` and then, when building the widget itself, we're checking if the value exists. In case it does not, the default to be used is `30.0`.

The double question mark `??` is called the `Null Aware Operator` which is similar to the `Ternary Operator`, but instead of checking truthy or falsey values, it simply checks for null values.

It would be the same as to write

```dart
marginAsDouble != null ? marginAsDouble : 30.0
```

using the `Ternary Operator`.
