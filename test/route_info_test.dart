import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:routemaster/routemaster.dart';
import 'package:routemaster/src/trie_router/trie_router.dart';

void main() {
  test("Route info with different paths are not equal", () {
    final plan = MaterialPagePlan('/', (_) => Container());
    final one = RouteInfo(RouterResult(plan, {}, '/one'), {}, plan);
    final two = RouteInfo(RouterResult(plan, {}, '/two'), {}, plan);

    expect(one == two, isFalse);
  });

  test("Route info with same paths are equal", () {
    final plan = MaterialPagePlan('/', (_) => Container());
    final one = RouteInfo(RouterResult(plan, {}, '/'), {}, plan);
    final two = RouteInfo(RouterResult(plan, {}, '/'), {}, plan);

    expect(one == two, isTrue);
  });

  test("Route info with same different query strings are not equal", () {
    final plan = MaterialPagePlan('/', (_) => Container());
    final one = RouteInfo(RouterResult(plan, {}, '/'), {'a': 'b'}, plan);
    final two = RouteInfo(RouterResult(plan, {}, '/'), {}, plan);

    expect(one == two, isFalse);
  });

  test("Route info with same query strings are equal", () {
    final plan = MaterialPagePlan('/', (_) => Container());
    final one = RouteInfo(RouterResult(plan, {}, '/'), {'a': 'b'}, plan);
    final two = RouteInfo(RouterResult(plan, {}, '/'), {'a': 'b'}, plan);

    expect(one == two, isTrue);
  });
  test("Route info with same different path params are not equal", () {
    final plan = MaterialPagePlan('/', (_) => Container());
    final one = RouteInfo(RouterResult(plan, {'a': 'b'}, '/'), {}, plan);
    final two = RouteInfo(RouterResult(plan, {}, '/'), {}, plan);

    expect(one == two, isFalse);
  });

  test("Route info with same path params are equal", () {
    final plan = MaterialPagePlan('/', (_) => Container());
    final one = RouteInfo(RouterResult(plan, {'a': 'b'}, '/'), {}, plan);
    final two = RouteInfo(RouterResult(plan, {'a': 'b'}, '/'), {}, plan);

    expect(one == two, isTrue);
  });
}
