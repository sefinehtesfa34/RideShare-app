// Mocks generated by Mockito 5.4.2 from annotations
// in rideshare/test/features/pick_location/data/datasources/ride_request_api_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:rideshare/features/pick_location/data/datasources/ride_request_api_provider.dart'
    as _i7;
import 'package:rideshare/features/pick_location/domain/entities/location.dart'
    as _i3;
import 'package:rideshare/features/pick_location/domain/entities/ride_offer.dart'
    as _i6;
import 'package:rideshare/features/pick_location/domain/entities/ride_request.dart'
    as _i8;
import 'package:rideshare/features/pick_location/domain/entities/user.dart'
    as _i2;
import 'package:signalr_core/signalr_core.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUser_0 extends _i1.SmartFake implements _i2.User {
  _FakeUser_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLocation_1 extends _i1.SmartFake implements _i3.Location {
  _FakeLocation_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHubConnection_2 extends _i1.SmartFake implements _i4.HubConnection {
  _FakeHubConnection_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HubConnection].
///
/// See the documentation for Mockito's code generation for more information.
class MockHubConnection extends _i1.Mock implements _i4.HubConnection {
  MockHubConnection() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get serverTimeoutInMilliseconds => (super.noSuchMethod(
        Invocation.getter(#serverTimeoutInMilliseconds),
        returnValue: 0,
      ) as int);
  @override
  set serverTimeoutInMilliseconds(int? _serverTimeoutInMilliseconds) =>
      super.noSuchMethod(
        Invocation.setter(
          #serverTimeoutInMilliseconds,
          _serverTimeoutInMilliseconds,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get keepAliveIntervalInMilliseconds => (super.noSuchMethod(
        Invocation.getter(#keepAliveIntervalInMilliseconds),
        returnValue: 0,
      ) as int);
  @override
  set keepAliveIntervalInMilliseconds(int? _keepAliveIntervalInMilliseconds) =>
      super.noSuchMethod(
        Invocation.setter(
          #keepAliveIntervalInMilliseconds,
          _keepAliveIntervalInMilliseconds,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get baseUrl => (super.noSuchMethod(
        Invocation.getter(#baseUrl),
        returnValue: '',
      ) as String);
  @override
  set baseUrl(String? url) => super.noSuchMethod(
        Invocation.setter(
          #baseUrl,
          url,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.Future<void>? start() => (super.noSuchMethod(
        Invocation.method(
          #start,
          [],
        ),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>?);
  @override
  _i5.Future<void> stop() => (super.noSuchMethod(
        Invocation.method(
          #stop,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> send({
    String? methodName,
    List<dynamic>? args,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [],
          {
            #methodName: methodName,
            #args: args,
          },
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Stream<T?> stream<T>(
    String? methodName, {
    List<dynamic>? args,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #stream,
          [methodName],
          {#args: args},
        ),
        returnValue: _i5.Stream<T?>.empty(),
      ) as _i5.Stream<T?>);
  @override
  _i5.Future<dynamic> invoke(
    String? methodName, {
    List<dynamic>? args,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #invoke,
          [methodName],
          {#args: args},
        ),
        returnValue: _i5.Future<dynamic>.value(),
      ) as _i5.Future<dynamic>);
  @override
  void on(
    String? methodName,
    _i4.MethodInvocationFunc? newMethod,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [
            methodName,
            newMethod,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void off(
    String? methodName, {
    _i4.MethodInvocationFunc? method,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #off,
          [methodName],
          {#method: method},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onclose(_i4.ClosedCallback? callback) => super.noSuchMethod(
        Invocation.method(
          #onclose,
          [callback],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onreconnecting(_i4.ReconnectingCallback? callback) => super.noSuchMethod(
        Invocation.method(
          #onreconnecting,
          [callback],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onreconnected(_i4.ReconnectedCallback? callback) => super.noSuchMethod(
        Invocation.method(
          #onreconnected,
          [callback],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [RideOffer].
///
/// See the documentation for Mockito's code generation for more information.
class MockRideOffer extends _i1.Mock implements _i6.RideOffer {
  MockRideOffer() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.User get user => (super.noSuchMethod(
        Invocation.getter(#user),
        returnValue: _FakeUser_0(
          this,
          Invocation.getter(#user),
        ),
      ) as _i2.User);
  @override
  _i3.Location get currentLocation => (super.noSuchMethod(
        Invocation.getter(#currentLocation),
        returnValue: _FakeLocation_1(
          this,
          Invocation.getter(#currentLocation),
        ),
      ) as _i3.Location);
  @override
  _i3.Location get destination => (super.noSuchMethod(
        Invocation.getter(#destination),
        returnValue: _FakeLocation_1(
          this,
          Invocation.getter(#destination),
        ),
      ) as _i3.Location);
  @override
  int get seatsAllocated => (super.noSuchMethod(
        Invocation.getter(#seatsAllocated),
        returnValue: 0,
      ) as int);
  @override
  double get price => (super.noSuchMethod(
        Invocation.getter(#price),
        returnValue: 0.0,
      ) as double);
  @override
  List<Object?> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object?>[],
      ) as List<Object?>);
  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
      ) as Map<String, dynamic>);
}

/// A class which mocks [RideRequestApiProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockRideRequestApiProvider extends _i1.Mock
    implements _i7.RideRequestApiProvider {
  MockRideRequestApiProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get baseUrl => (super.noSuchMethod(
        Invocation.getter(#baseUrl),
        returnValue: '',
      ) as String);
  @override
  _i4.HubConnection get hubConnection => (super.noSuchMethod(
        Invocation.getter(#hubConnection),
        returnValue: _FakeHubConnection_2(
          this,
          Invocation.getter(#hubConnection),
        ),
      ) as _i4.HubConnection);
  @override
  set hubConnection(_i4.HubConnection? _hubConnection) => super.noSuchMethod(
        Invocation.setter(
          #hubConnection,
          _hubConnection,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.Future<void> setupHubConnection() => (super.noSuchMethod(
        Invocation.method(
          #setupHubConnection,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<_i5.Stream<_i8.RideRequest>> getRideRequestsForPassenger(
          _i6.RideOffer? passenger) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRideRequestsForPassenger,
          [passenger],
        ),
        returnValue: _i5.Future<_i5.Stream<_i8.RideRequest>>.value(
            _i5.Stream<_i8.RideRequest>.empty()),
      ) as _i5.Future<_i5.Stream<_i8.RideRequest>>);
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
