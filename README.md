# Routemaster

Hello! This is an experimental Flutter router, building on [page_router](https://github.com/johnpryan/page_router).

To see how it works, start at the [example app](https://github.com/tomgilder/routemaster/blob/main/example/mobile_app/lib/main.dart).

I would love any feedback you have! Please create an issue for API feedback.

Please don't report bugs yet; it's way too early. There are almost no tests, so there will be bugs 😁 

There's currently no performance optimisation. Widgets are rebuilt way too much on navigation.

# Design goals

* Work with the Flutter Navigator 2.0 API, don't try to replace it.
* Design around user scenarios/stories, such as the ones in [the Flutter storyboard](https://github.com/flutter/uxr/files/5953028/PUBLIC.Flutter.Navigator.API.Scenarios.-.Storyboards.pdf) - [see here for examples](https://github.com/tomgilder/routemaster/wiki/Routermaster-Flutter-scenarios).
* Be opinionated: try not to provide 10 options to achieve a goal, but be flexible for all scenarios.


# Architecture 

The architecture mirrors Flutter's fairly closely.

You create immutable `RoutePlan` objects as mapping between paths and widgets:

`WidgetPlan('/search', (_) => SearchPage())`

These `RoutePlan` objects have a `createState()` object which creates a mutable `RouteState` object to manage the in-memory state.

So for instance `TabPlan` creates a `TabRouteState`, which has a `index` property for which the current tab is.

# Name

Named after the original Routemaster:

![A photo of a Routemaster bus](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Routemaster_RML2375_%28JJD_375D%29%2C_6_March_2004.jpg/320px-Routemaster_RML2375_%28JJD_375D%29%2C_6_March_2004.jpg)

(photo by Chris Sampson, licensed under CC BY 2.0)