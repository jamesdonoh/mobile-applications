---
title: Mobile Application Development - Project Report
author: James Donohue - <james.donohue@bbc.co.uk>
---

> Note: this is my report for the Mobile Application Development module. It is accompanied by a folder which contains the prototype (`prototype/`) produced during the project as well as the source code of the app (`src/`). For details on building and using the app, please see the section on *Build process* below.

# Case study

As the mobile application ('app') sector continues to grow vendors are looking for new features and approaches that will help them stick out in a crowded marketplace. This case study will focus on one business sector, fast food, and identify some requirements for a new mobile application, with reference to business trends and existing applications.

## Background

A recent report by the Department for Environment, Food & Rural Affairs [@defra2016] showed that annual UK expenditure on catering is nearly £60 billion. In addition, the same report showed 'Special offers/promotions' to be the third most significant factor influencing consumer choice, after 'Price' and 'Quality'. This supports the idea that special offers have a very significant role to play in attracting customers to food outlets.

Fast food outlets, also known as quick service restaurants or QSRs [@farrell], are big business globally. More recently the trend towards 'fast-casual' restaurants, without table service but with a better quality of food than traditional fast food outlets, has begun to spread outside the US and is expected to have a significant impact on the UK market [@henkes].

A recent study by the Waste and Resources Action Programme [@wrap] showed that QSRs account for 25% of all meals eaten out in the UK and produce 76,000 tonnes of food waste per year, costing the sector £277m. Of this amount, 21% was ascribed to 'spoilage'. Given the need to feed an growing world population, there are therefore both commercial and moral arguments for reducing the amount of wasted food.

In the past few years there has been an explosion of apps and websites offering home meal delivery, either by takeaways themselves (via apps such as Just Eat and Hungryhouse) or more recently by 'last mile' [@ft2016] delivery companies with their own network of couriers (Deliveroo and Uber Eats). These apps have been enormously popular: Uber reported that over 100,000 people downloaded the Uber Eats app in the first few days of its launch [@ft2016]. It is clear that apps are becoming an important way that users search for and source their meals.

However, these new apps are largely focused on the home delivery market, meaning potential customers wishing to 'eat out' derive little use from them. A number of apps exist for finding local restaurants and food outlets (such as TopTable) but while these allow special menus and other offers to be highlighted, they are primarily focused on more upmarket restaurants that take reservations.

This suggests that there is therefore still potential for 'disruptive technologies' [@bower1995] to transform the way that restaurants, especially fast and fast-casual food outlets, attract customers using special offers and other promotions.

## Proposal: _HalfPrice Sushi_

The mobile application proposed for this report will allow users to discover time-limited special offers on fast food in their vicinity. It will offer a simple and convenient interface to allow users to locate and select outlets, and allow them to share anonymous information about their experience of these outlets which can be used to improve the quality of the service for all users.

In order to provide a clear focus for development and marketing, the initial version of the app will focus on one type of special offer and one type of fast food popular in London: sushi. The Itsu chain, with annual sales of £82.6m [@telegraph], currently has 69 quick service sushi restaurants, of which 58 are in central London. The density of outlets in the capital therefore make it an ideal subject for a location-aware app. Half an hour before closing, each Itsu reduces the price of most of its cold food boxes by 50%. One reason for this offer is clearly that much of these boxes contain _sashimi_ (raw fish)

The company's founder Julian Metcalfe claims that the half-price sale, apparently inspired by those that occur in Japanese department stores, both encourages customers to try different dishes, and gives others who could not normally afford to eat at Itsu the opportunity to try it [@itsu].

Despite this focus on a type of offer, the application should be designed and implemented in a way which would allow it to support other types of food and drink in future, either within the same multi-purpose app or as a family of similarly-branded apps. The sushi application.

The target app technology platform will be Android, which continues to enjoy market dominance, accounting for over 80% of new smartphone shipments [@meeker2016]. This therefore offers the largest potential user base to evaluate and enjoy the app's features.

## Domain research

### Just Eat

The first screen that the user sees when running the Just Eat app prompts them to enter their postcode:

![Just Eat: postcode input screen](justeat-postcode.png){ width=50% }

As an alternative to entering a postcode manually, tapping the crosshair symbol to the right-hand side of the input box activates the device's geolocation feature to be used instead. This symbol is consistent with its use elsewhere on the Android platform, however research suggests that truly universal icons are rare and should therefore be accompanied by a text label to eliminate ambiguity [@harley].

## Requirements

Before work can begin on designing the user interface for the app we need to explore how the system is going to work systematically. This process of requirements gathering should consider both _functional_ and _non-functional_ requirements. The division between these two classes of requirements will be discussed below.

Arlow and Neustadt [-@arlow] propose using simple 'shall' statements combined with unique identifiers to capture requirements, e.g.

> _id_ The _system_ shall _function_

For the purposes of setting requirements I will take a similar approach, omitting the repeated phrase "The app shall". In addition, it is useful to capture the relative _priority_ of requirements to help in planning the development process. For this project we will use the requirement level terminology formalised by RFC 2119 [-@bradner]. Other options include the MoSCoW criteria (Must have, Should have, etc.) described by Arlow and Neustadt [-@arlow], or levels (High, Medium or Low).

In a normal requirements gathering process we might perform interviews or workshops with stakeholders or use questionnaires to elicit information. For the purposes of this project, functional and non-functional requirements will be identified primarily based on the background and domain research described above, along with the applicable Android design principles [@androiddesign].

These requirements describe only a minimum viable product (MVP), in other words an acceptable version of the app that could be released and used to learn more about customer needs through testing and other research. Future iterations of the development cycle may add additional requirements based on user feedback and new business requirements.

### Functional

Functional requirements define things that the product must do in order to be useful to the person using it [@robertson2012]. For example, a weather application needs to be able to give information about the weather forecast for the next few days. Below is a table summarising the functional requirements that have been identified for this case study.

Identifier Description                                                Priority
---------- ---------------------------------------------------------- --------
      FR01 Show offers based on the user's physical location             Must
      FR02 Show offers based on remaining duration                       Must
      FR03 Display detailed information about each offer and location    Must
      FR04 Allow user to specify location manually                     Should

Table:  Summary of functional requirements

These requirements are explained and justified in detail in the following sections.

#### FR01: List offers based on proximity to the user's location, if known

As GPS receivers have become a standard feature on smartphones, users now expect mobile apps containing location-specific information to give them the option of sharing their position automatically via the phone's geolocation facility. Avoiding having to manually select a location is an example of 'adaptive user experience' and can be an important way of saving the user time and giving them a seamless experience [@wimberley].

It should be noted that not all smartphone owners are comfortable with using geolocation features, sometimes because of doubts over how information about their location might be used by app developers. A recent survey [@punchtab] showed that 50% of mobile users were reluctant to share their location due to privacy concerns. However, the same survey showed that the biggest reason given (88%) for users to allow location tracking was the availability of "coupons or special offers". This suggests that users will be prepared to allow _HalfPrice Sushi_ to access their location because it will provide them with such offers. However the app should be designed so that it is still usable even without access to location services.

#### FR02: List offers based on start and finish time

Since one of the unique selling points of the app is the ability to provide time-limited special offers, it makes sense that users should be able to see which offers are starting or finishing near them soon. The user interface should summarise the start and finish time (and optionally, the remaining duration) of each offer in a way that is easy to understand, along with its location. This will allow the user to make a decision about which offer to use based on both time and location factors.

#### FR03: Allow users to customise the sort order of the list view

Users may wish to sort the list of offers either by distance or by time remaining. This feature should be provided via a button in the app Action Bar. However, the button should only be shown in when the list view is visible, not in the map view, thereby following the Android Design Principle [@androiddesign] of _only show what I need when I need it_.

#### FR04: Display a detailed view of each offer and location

Once the user has identified an offer that they are interested in, they should be able to tap or click on it to see a more detailed view. The detailed view should provide all information that the app holds about the offer, along with any applicable time restritions (such as opening hours). The detailed view should also give an indication of the location where the offer can be redeemed, such as through a simplified (non-interactive) small map.

#### FR05: Provide map-based view of all offers in the surrounding area

Instead of viewing a list of offers based on proximity, users may prefer to see a graphical map showing their position in relation to the offers around them. This is because some users express a preference for (ref?) graphical visualisations over textual list-type views. Providing a map-based interface also adheres to the Android Design Principle _real objects are more fun than buttons and menus_. [@androiddesign]. However, care must be taken not to 'overload' view with an excessive number of markers which may obscure map details and prevent users from orienting themselves in the surrounding area.

#### FR06: Allow user to see their location in the map view

Users are accustomed to map views offering a 'My Location'-type feature which indicates their current position in relation to places of interest around them, often using a blue dot. This type of feature should also be incorporated into the map view for consistency with other apps such as Google Maps itself.

#### FR07: Indicate which offers currently avaible using graphics

Following the Android Design Principle that _pictures are faster than words_ [@androiddesign], the user interface should use graphics and other visual effects (such as highlight colours) to identify the status of each offer. An example of this would be to use a different icon to represent an offer that is currently available on list and map views, rather than a simple piece of text. However, if icons are used, care should be taken to ensure that they are easily understood by the majority of users (ref Hamburger icon article) and do not create confusion.

#### FR08: Initialise database of available offers using external API

The list of offers available using the app may change periodically as new partners decide to participate or existing partners decide to change the terms of their offers (for example start or end times). To ensure that the app always offers the most up-to-date list of available offers when it is installed, the offer database should be obtained by making a call to a central REST API when the app is run for the first time.

If problems occur when initialising the database from the web API, the app should give the user the opportunity to retry the operation, avoiding unneeded technical detail. This adheres to the Android Design Principle of _it's not my fault_ [@androiddesign].

#### FR09: Update offer database automatically using API without requiring app update

Users should be able to take advantage of udpated offer information without having to upgrade or reinstall the app itself. The app should periodically check the API in order to update its local database of offers. However the update process, and in particular any network errors that occur, should not interfere with the normal operation of the app (again, as per _it's not my fault_).

#### FR10: Support adding users' personal ratings for each offer

The Android Design Principle _let me make it mine_ [@androiddesign] states that users like to add personal touches and 'optional customisations'. This principle is met by allowing users to assign a 'star rating' on the detailed offer view. The star rating they give each offer should be stored by the app and redisplayed on subequent uses of the detailed view, also following the principle of _never lose my stuff_.

#### FR11: Upload anonymised user ratings to central database

When a user has added a personal rating for an offer, as well as storing the rating internally the app should attempt to submit the rating to a central database (including the offer identifier, rating and date and time when the rating was set). At this stage no personally identifiable data (such as location) should be sent to the server to avoid infringing the user's privacy. A server using a REST API will be made available to receive ratings sent by the app.

The rationale behind this requirement is to build up a central database of ratings that could be used to provide additional features in future based on which offers have the highest (or lowest) user rating. For example, a shop with a large selection of reduced items could be highlighed by the app for special consideration by the user.

#### FR12: Use simple sound effects to respond to user actions

Following the Android Design Principles [@androiddesign] _delight me in surprising ways_, the app should make judicious use of sound effects to respond to and reward user activity. An effect should be played both when a user opens the detailed view of an offer and when they as a personal rating for the offer. The goal is to encourage the user to interact with the app more and make their experience more enjoyable.

### Non-functional

Non-functional requirements are other qualities that the product must have in order to be acceptable to the user [@robertson2012]. These may include such properties as security, capacity, performance and compliance to standards. They can also be described as constraints placed on the system [@arlow].

#### NFR01: Support up to 1000 offers at one time without impaired function

The app should be able to handle a large database of offers to allow it to continue to be work effectively even many additional partners are signed up. The initial offer database is expeced to contain less than 100 offers, however the behaviour of the app with up to 1000 offers should not be noticeably impaired in any way.

#### NFR02: Respond to all user interactions within 100ms

#### NFR03: Localisation support

As the app may be launched in future in other countries, it is essential that it can be easily translated into other languages. For this reason all strings and graphical text used within the app should be stored using localised resources instead of being hard-coded. The default language may be assumed to be English. No special support for right-to-left text or layouts is required for the MVP app.

#### NFR04: Accessibility

?

#### NFR05: Standards? Privacy etc?

# Design and prototyping

## Platform strategy

The functional and non-functional requirements described above could be provided in a variety of ways, including a mobile website or an iOS app. It is essential that any new mobile project includes a cross-platform strategy, which specifies the platforms which will be catered for in order to maximise business benefit.

One goal for this project was to create an app that was usable by as many people as possible. With 86.8% smartphone OS market share [@idc], Android was the obvious choice to achieve this. I set a target of 95% of Android mobile users. Based on this target, I decided to target Android versions 4.1 (Jelly Bean) and above, also known as API level 16, which has a cumulative distribution of 95.2%, as shown in Figure \ref{jellybean}.

![Android 4.1 (Jelly Bean) statistics from Android Studio\label{jellybean}](jellybean.png)

A mobile website was also considered but rejected on the grounds that for maximum usefulness it would require access to the device's GPS functionality, which can currently be more easily achieved using a native app. Native apps also offer the possibility of future monetisation through adding premium features.

## Prototypes

Developing a mobile application on Android application can be time-consuming and therefore costly for organisations. The purpose of creating a prototype is to plan the user interface for the application without making a significant development investment. It allows business owners to give feedback on the designs at a stage where they can easily be changed, and also allows some types of usability testing to validate the interface.

Using the functional requirements described above, prototypes were created using the Justinmind software. This provides a convenient set of user interface components (e.g. widgets) that replicates the user experience of the Android platform. The advantage of this over using simple wireframes or paper prototypes is that it will more closely reflects the look and feel of the eventual product.

### Viewing the prototype

The `prototype/` folder contains a file `index.html` which can be opened to view the prototype. On Chrome you may receive a warning about needing to install an extension, if so please follow the instructions given.

### Designing the user interface

Although as Nielsen [-@nielsen1996] points out, 'Designers Are Not Users', and we should be wary of using our intuition alone in making design decision, for the purposes of creating an MVP for this project I used my own wishes and expectations as a guide in organising the user interface. In a larger-scale project I would have conducted interviews with stakeholders and potential users during the process of designing the interface.

In addition, it is important to keep referring to the requirements gathered at the initial stage in order to ensure traceability and check that the app is meeting all of them.

### Multi-device support

We can assume that the primary use of the app will be by mobile users, since it provides functionality in the 'eating out' scenario where it can be assumed that users are less likely to be at home and have access to larger devices. Nonetheless, some users do carry tablets with them and many newer tablets include GPS receivers which would allow the user's location to be identified similarly to a mobile.

For larger screen widths, such as a tablet in landscape orientation, a different screen layout should be offered in order to make more efficient used of the increased available space. This approach is endorsed by the Android Best Practices, which state that "the objective of supporting multiple screens is to create an application that can function properly and look good on any of the generalized screen configurations supported by Android." [@androidscreens].

![Dual-pane mode for tablet\label{dualpane}](tablet-dualpane.png)

For this app a dual-pane screen layout (Figure \ref{dualpane}) will be created for tablet users in landscape mode, replacing the separate list and detail views with a combined dual-pane mode. The advantage of this mode is that it makes it easier to flick between several offers and makes better use of screen real estate.

### Splash screen

The functional requirements for the app (ref?) include the need to load new offer data when it is first started. It would be confusing for the user if the list view of offers were displayed before any data was available to populate it. To avoid this problem we can display a temporary screen to the user (sometimes known as an interstitial, or 'splash' screen) before the user interface fully appears.

Nielsen [-@nielsen2013] describes splash screens as a 'user experience sin' that has been reintroduced in the mobile app era. However, the specification for Material Design [@material], the recommended Android design language, argues in favour of 'launch screens' on the grounds that they increase perceived loading time. They also provide an opportunity to display the app logo and "improve brand recognition". Notably, it recommends that the launch screen should only be shown for the initial 'cold' launch from the home screen.

# Architecture

## Model View Controller

Model View Controller (MVC) is a well-established pattern in application architecture for creating a separation of concerns between user interface and business logic and/or domain model.

According to Fowler [@fowler] the separation of presentation from model is of fundamental importance in software architecture. It allows code that describes business logic and provdes access to data (for example via databases or APIs) to be developed and tested separately, independently of the user interface, and enables the possibility of reusing the same model code with different interfaces (such as a website and the command-line). It also allows for greater specialisation of development skills within different areas, and simplification of the development process.

The MVC pattern originated in experiments in graphical interfaces conducted at Xerox PARC the late 1970s and was originally implemented for the Smalltalk language. As originally conceived, the model is an abstract representation of some type of knowledge, while the view or views are representations of that model that the user can interact with, while creating the impression they are seeing and manipulating the model directly [@reenskaug].

The exact role of the controller has been interpreted differently by authors. Fowler says that the controller takes user input, manipulates the model and causes the view(s) to update [@fowler]. However, Reenskaug's proposal was that views handle their own user input, with the controller only responsible for coordinating views and handling level at the input of the whole application [@reenskaug]. It is worth noting that Fowler believes the precise separation between view and controller (V/C) is less important than the separation between model and presentaion (M/VC).

As with other layered architectures, the potential benefits of MVC are that it helps to manage the complexity of a large application, allowing new developers to understand the codebase and find where a particular piece of functionality is implemented. This may lead to a reduction in maintainance costs. As a form of modularisation, it also facilitating reuse of code, and enables the implementation of different parts of the application to be changed by reducing the amount of coupling between classes.

## MVC and the Android platform

The Android platform supports an MVC architecture but does not enforce the use of any one paradigm. Instead developers have to make conscious decisions to avoid mixing data/model and presentation concerns within the same layer. Apart from the provided `View` class hierarchy, Android does not use MVC terminology directly. However, one typical way of mapping MVC into Android is outlined by [@bignerd]:

- model classes are custom Java classes (which do not normally inherit from Android platform classes). 
- the view(s) layer are the Android `View` classes (usually instantiated through the layout file mechanism), which are able to draw themselves and handle user input
- the 'controller' is collection of the `Activity`, `Fragment` and/or `Service` classes that contain all the application logic and manage the flow of data between the model and view layers

According to [@fowler] the model in MVC should be essentially non-visual and not depend on any user interface components. In practical terms, this strongly suggests that the model classes in an Android app should not `import` any Java classes that correspond to user interface features, such as `View`s or `Fragment`s. Where model classes have unit tests, this also allows them to be run in isolation without any dependency on a specific version of the Android API.

Another way that separation between model and presentation can be encouraged is to use a separate Java package for the model classes. Fields and methods that are only used within model classes can therefore be declared as package-private through the omission of any explicit access level modifier [@javaaccesscontrol]. This helps to restrict access to the model from other packages (such as those containing user interface classes) to its public interface, and supports the object-oriented design principle of encapsulation [@booch]. As a secondary benefit, it permits the model implementation (for example, the choice of persistence layer) to change without affecting the rest of the application.

An essential feature of MVC on Android as described by [@bignerd] is that there must be no direct communication between model and view classes - the controller(s) always acts as an intermediary, updating views with changes to model objects and changing models as required in response to user input. This is effectively an application of the so-called Law of Demeter [@booch] which requires code units to only communicate with other directly-related code units. Model classes should know nothing about the widgets and other user interface components used to represent them.

Fowler [@fowler] identifies one common problem for rich clients: the need to ensure consistency of data across multiple views. Any change to the model, whether caused by a user interacting with one presentation or by external events, needs to be reflected across all presentations. In the Android platform we can approach this problem by ensuring that `Fragment`s register event listeners for any changes to the model they use.

## Use of MVC within _HalfPrice Sushi_

Reenskaug suggests that the MVC paradigm is beneficial when the user needs to see the same data in different contexts and/or different viewpoints [@reenskaug]. The _HalfPrice Sushi_ app has exactly this requirement, showing users information about special offers using three different 'views':

  - as an ordered textual list
  - arranged as markers on a geographical map
  - in a 'close up' view of an individual offer with additional details

The model classes have been organised into a separate package, `io.github.jamesdonoh.HalfPrice Sushi.model` to show the separation of model and presentation. Additionally, package-private access has been specified for members that should not be used outside the package (for example, the constructor for the `Outlet` class).

    (add diagram showing activity acting as intermediary?)

The `Activity` and `Fragment` classes used within the app act as controllers, with no direct interaction between model and view classes. Additionally, the use of a `RecyclerView` within `OutletListFragment` allows the underlying data source (a `List` of `Outlet` instances) to be abstracted away from the list view layer via a custom `RecyclerView.Adapter` subclass (note that this class is not a part of the `.model` package itself, although it manages objects from that package). The `RecylerView` does not interact directly with any `Outlet` objects directly but delegates this behaviour to the `Adapter` and `ViewHolder` abstractions.

# Development

## Tools and methodology

The development of the finished app followed iterative 'agile'-type process. Although it would have been possible to implement each section of the application as a separate mini-project with its own schedule and goals, I worked on all areas of functionality at once incrementally, attempting to ensure the app was in a working state at all times and could be demonstrated if required.

A simple [Kanban](https://en.wikipedia.org/wiki/Kanban)-style board was created to track units of work in progress in various categories (e.g. 'In progress', 'Ready', 'Up next') and ensure that nothing was missed. This was implemented using the [Trello](https://trello.com) card management tool.

`git` was used as a VCS (Version Control System). Even though only a single developer was working on the project at any one time, this made it possible to easily step back to previous versions to help fix bugs, and to view a history of development progress. The repository was also pushed to GitHub as a backup and can be browsed online at <https://github.com/jamesdonoh/HalfPrice Sushi-android>.

## Multi-device support

The dual-pane tablet mode described above can be implemented on Android by providing different XML layout files and then using 'configuration qualifiers' to determine when those layouts should be applied. In earlier versions the recommendation was to use the generalised screen sizes (such as `large`, `xlarge`) to select layouts; this has been deprecated since Android 3.2 in favour of using `dp` (density-independent pixel) sizes [@androidscreens].

In the case of _HalfPrice Sushi_, I have decided to use the dual-pane mode on devices where the available screen width is over 600dp (the typical width of a 7" tablet). This is implemented by providing two XML layout files for `OutletListFragment`:

    res/layout/fragment_outlet_list.xml           # For handsets
    res/layout-w600dp/fragment_outlet_list.xml    # For tablets

An alternate approach would be to determine the screen size at runtime (perhaps using `Display#getMetrics`) and switch the layout programatically. The advantage of using configuration qualifiers is that the platform takes care of the switching without the need to write any code. It also allows for better support within IDEs.

Note that some code to explicitly detect dual-pane mode is included.

## Location services

In order for location services to function on the Android platform specific permissions are required. These must be declared in the `AndroidManifest.xml` file, e.g.:

    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />

Also, since Android API level 23, users grant permissions to apps at runtime rather than when the app is installed. This requires an additional check in `OutletFinderActivity`:

    if (ContextCompat.checkSelfPermission(this.getApplicationContext(),
        android.Manifest.permission.ACCESS_FINE_LOCATION)
            == PackageManager.PERMISSION_GRANTED) {
                ...
            }

In the event that permissions have not been granted, on Android 23+ a dialog is then displayed prompting the user to accept, as show in figure \ref{allowlocation}.

## Code manageability

# Testing

## Build process

To build the app, open the `src/` folder in Android Studio 2.x, click *Run > Run 'app'* and select a suitable connected device or emulator. This will build the app and install it on the emulator or device.

## Types of testing

During and after development it is essential to incorporate testing using a variety of approaches. This project includes different types of testing:

- Unit testing
- Usability testing
- Functionality testing

The following sections describe the approach taken for each of these in more detail.

## Unit testing

Unit tests are software tests, usually automated, that can be used to determine the correctness of a unit of software. In object-oriented software development (including Android) the class is normally considered the unit of software, however this is at the discretion of the developer and unit tests may span multiple related classes that collaborate with each other [@fowlerunit]. Another characteristic of unit tests is that they are typically fast, and can therefore be run regularly during the development process to catch regressions more quickly. Some (such as [@vogella]) suggest that 70-80% of tests written should be unit tests.

Android Studio subdivides unit tests into 'local unit tests', defined as tests which can be run on the developer's machine without any dependency on the Android framework, and 'instrumented tests' which must be run on an Android hardware device or emulator. Both are implemented using the popular [JUnit](http://junit.org/junit4/) testing framework.

### Local unit tests

The file `OutletTest.java` implements some unit tests for the `Outlet` model class, demonstrating the approach of testing a class without any framework dependencies. An `initialise` method with the `@Before` annotation is used to set up the object under test, after which a series of methods with the `@Test` annotation exercise different methods of the `Outlet` class under different scenarios, such as with or without ratings or opening hours having been set.

### Instrumented tests

Or not?

## Usability testing

Whether a mobile app is usable can be equally important as whether it is functional. Usability is is defined by ISO 9241-11 as the 

> extent to which a product can be used by specified users to achieve specified goals with effectiveness, efficiency and satisfaction in a specified context of use [-@iso9241, section 3.1] 

As Brooke [-@brooke] points out, in order to assess these three characteristics of effectiveness, efficiency and satisfaction we also need to consider the context in which the product or system is used and the purpose it used for. The effectiveness of an online clothes' retailer's website cannot be easily compared to the effectiveness of a system for managing railway track safety. 

### Testing plan

Nielsen [-@nielsen1996] outlines an approach he called 'Discount Usability Engineering' which relies on the following techniques in order to uncover usability problems at low cost to the organisation:

- User and task observation
- Simplified thinking aloud
- Scenarios
- Heuristic evaluation

In order to apply the first three of these to this project, five users were selected to participate in usability tests. This follows Nielsen's [-@nielsen2012] other observation of rapidly diminishing returns when more than five participants are used. Those who worked in software development or user experience design were excluded from the trials due to the possibility of them having unusual levels of expertise. All of the users were familiar with the geographical area which is the main focus of the app (Central London) and were familiar with the terms of the specific food offer provided (reduced sushi).

The format of the testing was a series of 10-15 minute sessions in which each participant was asked to complete a series of directed tasks using the app on a mobile phone, while an observer watched and took notes about their progress. As each user performed the task they were required to say aloud what they were seeing and doing. There was no fixed number of tasks to be performed, as some users completed them more quickly than others. The tasks were given context by situating them in a scenario that explained the user's motivation, without telling them exactly how to complete the task. They included:

- Find the sushi outlet nearest to you right now with a special offer starting at 5pm
- You want to know what time the Aldgate outlet closes on Tuesdays - find this out
- You had a bad experience in the Bishopsgate outlet, find it and give it a rating
- You know there is a sushi outlet somewhere near Regent's Park, find it

At the end of the tasks, the user was asked to give any specific feedback about the app and also to complete a survey on their feelings about its usability (see below).

### Survey design

Several measures exist for making subjective assessments of usability, usually through questionnaires which users of the system are asked to complete by putting a numeric score against a series of statements or prompts. Although a custom metrics could be created for each research exercise, one advantage of using a ready-made scoring system is that it allows for rough comparison both across versions of a product and between different products  Using an existing scale also reduces some of the costs associated with usability research.

The System Usability Scale (SUS) created by Digital Equipment Corporation is one such measure [@brooke]. It is implemented using a Likert scale in which the respondent indicates their level of agreement or disagreement with statements such as _I found the system unnecessarily complex_. The SUS has only ten questions and can therefore be completed quickly and easily.

### User feedback

A number of useful insights were obtained from observing users interacting with the app and describing their own actions, and from asking their opinions at the end of the tasks. These insights were recorded and used in order to make improvements to the user interface. They included:

- One user identified that the 'sort' button's purpose was not clear. It was not obvious from the design how the offers are sorted when the app first loads, or how this changes when the sort button is clicked. One way of addressing this might be to use a drop-down menu in the App Bar containing 'Sort by Time' and 'Sort by Location' options.

### Quantitative data

The results of the SUS surveys were collected and used to generate a diverging stacked bar chart for analysis, show in Figure \ref{sus}. This is a recommended technique for visualising Likert scales [@robbins].

![Stacked bar chart illustrating SUS results\label{sus}](sus-barchart.png)

From this data we can see that users had a generally positive reaction to the usability of the system. Most users tended to disagree with negative statements such as _I found the system very cumbersome_ and to agree more strongly with positive ones such as _I felt very confident_. It is interesting to note that two statements, _I thought there was too much inconsistency_ and _I found the various functions in this system were well integrated_ did not receive either strong agreement or disagreement. One possible explanation for this is that participants may not have understood the somewhat specialist language used by the SUS in these statements.

One obvious limitation of these results is the relatively small sample size used. Nielsen [-@nielsen2012] recommends surveying 20 respondents when making quantitative studies. The survey could be repeated with a larger sample size to improve the quality of the results.

## Functional testing

Functional testing is a form of software testing that verifies whether the system meets the original functional requirements that led to its creation. It essentially focuses on whether the software does what it is supposed to do, viewing it as a 'black box', without any knowledge of how the system has been implemented [@desikan]. In this sense it reflects the point of view of a user of the system.

One way of conducting functional testing this is to producte a set of test cases using from the requirements described at the start of the development process, by writing a list of simple steps that can be followed to check each requirement against the expected behaviour. Alternate flows and error scenarios should also be considered. These steps can then be checked manually by a test engineer and the results recorded. Each test case should include a reference to the original requirement that produced it, in order to ensure traceability and make it possible to verify of the level of test coverage of each requirement.

The following functional test scenario demonstrates this approach:

### Functional test TR01

Requirement(s) tested
:    FR04 (Display a detailed view of each offer and location)

Description
:    Checks if the user can view detailed information about an offer from the list view

Steps
:    1. View the list of available offers
     2. Tap on one of the offers displayed

Pass criteria
:    A detailed view is displayed corresponding to the offer that the user selected

Result
:    Pass

### Functional test TR02

Requirement(s) tested
:    FR08 (Initialise database of available offers using external API)

Description
:    Checks if the user can continue to use the app using cached offer data in the event of network failure

Steps
:    1. Ensure the app has been previously run and successfully loaded data from the API
     2. With no network access available, run the app from the home screen

Pass criteria
:    The list of offers should be displayed using cached offer data, and a message should be displayed warning the user that the update failed.

Result
:    Pass

# Evaluation and conclusions

Although simple, the finished MVP app demonstrates most of the functionally described in the requirements and would be a suitable basis for publishing in order to gather learning about user behaviour and to inform the next iteration of development.

One architectural aspect which could be improved is the approach to persisting local changes to data made by the application. At present, when the user adds a rating to an offer, the `OutletCache` class has to separately update the local database (via `OutletDatabaseHelper`) and the remote API (via `OutletApi`. A cleaner design would be to implement the database helper more like a write-through cache, so that only a single call is required which implicitly persists the rating in both places. This could be a requirement of a future iteration of the product.

# References
