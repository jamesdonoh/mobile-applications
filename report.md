---
title: Mobile Applications - Project Report
author: James Donohue
abstract: A case study for the development of a mobile application to serve the fast food retail sector is analysed.
---

# Introduction

This is my report for the Mobile Applications MSc. There are a number of Android design principles [@androiddesign] we should follow.

As the mobile application ('app') sector continues to grow (ref?), vendors are looking for new features and approaches that will help them stick out in a crowded marketplace. This case study will focus on one business sector, fast food, and identify some requirements for a new mobile application, with reference to business trends and existing applications.

# Case study

## Background

A recent report by the Department for Environment, Food & Rural Affairs [@defra2016] showed that annual UK expenditure on catering is nearly £60 billion. In addition, the same report showed 'Special offers/promotions' to be the third most significant factor influencing consumer choice, after 'Price' and 'Quality'. This supports the idea that special offers have a very significant role to play in attracting customers to food outlets.

Fast food outlets, also known as quick service restaurants or QSRs [@farrell], are big business globally. More recently the trend towards 'fast-casual' restaurants, without table service but with a better quality of food than traditional fast food outlets, has begun to spread outside the US and is expected to have a significant impact on the UK market [@henkes].

A recent study by the Waste and Resources Action Programme [@wrap] showed that QSRs account for 25% of all meals eaten out in the UK and produce 76,000 tonnes of food waste per year, costing the sector £277m. Of this amount, 21% was ascribed to 'spoilage'. Given the need to feed an growing world population, there are therefore both commercial and moral arguments for reducing the amount of wasted food.

In the past few years there has been an explosion of apps and websites offering home meal delivery, either by takeaways themselves (via apps such as Just Eat and Hungryhouse) or more recently by 'last mile' [@ft2016] delivery companies with their own network of couriers (Deliveroo and Uber Eats). These apps have been enormously popular: Uber reported that over 100,000 people downloaded the Uber Eats app in the first few days of its launch [@ft2016]. It is clear that apps are becoming an important way that users search for and source their meals.

However, these new apps are largely focused on the home delivery market, meaning potential customers wishing to 'eat out' derive little use from them. A number of apps exist for finding local restaurants and food outlets (such as TopTable) but while these allow special menus and other offers to be highlighted, they are primarily focused on more upmarket restaurants that take reservations.

This suggests that there is therefore still potential for 'disruptive technologies' [@bower1995] to transform the way that restaurants, especially fast and fast-casual food outlets, attract customers using special offers and other promotions.

## Proposal: _halfpricesushi_

The mobile application proposed for this report will allow users to discover time-limited special offers on fast food in their vicinity. It will offer a simple and convenient interface to allow users to locate and select outlets, and allow them to share anonymous information about their experience of these outlets which can be used to improve the quality of the service for all users.

In order to provide a clear focus for development and marketing, the initial version of the app will focus on one type of special offer and one type of fast food popular in London: sushi. The Itsu chain, with annual sales of £82.6m [@telegraph], currently has 69 quick service sushi restaurants, of which 58 are in central London. The density of outlets in the capital therefore make it an ideal subject for a location-aware app. Half an hour before closing, each Itsu reduces the price of most of its cold food boxes by 50%. One reason for this offer is clearly that much of these boxes contain _sashimi_ (raw fish)

The company's founder Julian Metcalfe claims that the half-price sale, apparently inspired by those that occur in Japanese department stores, both encourages customers to try different dishes, and gives others who could not normally afford to eat at Itsu the opportunity to try it [@itsu].

Despite this focus on a type of offer, the application should be designed and implemented in a way which would allow it to support other types of food and drink in future, either within the same multi-purpose app or as a family of similarly-branded apps. The sushi application.

The target app technology platform will be Android, which continues to enjoy market dominance, accounting for over 80% of new smartphone shipments [@meeker2016]. This therefore offers the largest potential user base to evaluate and enjoy the app's features.

## Domain research

### Just Eat

The first screen that the user sees when running the Just Eat app prompts them to enter their postcode:

![Just Eat: postcode input screen](justeat-postcode.png){ width=50% }

As an alternative to entering a postcode manually, tapping the crosshair symbol to the right-hand side of the input box activates the device's geolocation feature to be used instead. This symbol is consistent with its use elsewhere on the Android platform, however research suggests that truly universal icons are rare and should therefore be accompanied by a text label to eliminate ambiguity [@harley].

## Requirements

Before work can begin on designing the user interface for the app we need to explore how the system is going to work systematically. This process of requirements gathering should consider both _functional_ and _non-functional_ requirements. The division between these two classes of requirements will be discussed below.

Arlow and Neustadt [-@arlow] propose using simple 'shall' statements combined with unique identifiers to capture requirements, e.g.

> _id_ The _system_ shall _function_

For the purposes of setting requirements I will take a similar approach, omitting the repeated phrase "The app shall". In addition, it is useful to capture the relative _priority_ of requirements to help in planning the development process. For this project we will use the requirement level terminology formalised by RFC 2119 [-@bradner]. Other options include the MoSCoW criteria (Must have, Should have, etc.) described by Arlow and Neustadt [-@arlow].

In a normal requirements gathering process we might perform interviews or workshops with stakeholders or use questionnaires to elicit information. For the purposes of this project, functional and non-functional requirements will be identified primarily based on the background and domain research described above, along with the applicable Android design principles [@androiddesign].

### Functional

Functional requirements define things that the product must do in order to be useful to the person using it [@robertson2012]. For example, a weather application needs to be able to give information about the weather forecast for the next few days. Below is a table summarising the functional requirements that have been identified for this case study.

Identifier Description                                                Priority
---------- ---------------------------------------------------------- --------
      FR01 Show offers based on the user's physical location             Must
      FR02 Show offers based on remaining duration                       Must
      FR03 Display detailed information about each offer and location    Must
      FR04 Allow user to specify location manually                     Should

Table:  Summary of functional requirements

These requirements are explained and justified in detail in the following sections.

#### FR01: Show offers based on the user's physical location

As GPS receivers have become a standard feature on smartphones, users now expect mobile apps containing location-specific information to give them the option of sharing their position automatically via the phone's geolocation facility and thereby avoid having to enter it manually. This is an example of 'adaptive user experience' and can be an important way of saving the user time and giving them a seamless experience [@wimberley].

However, not all smartphone owners are comfortable with using geolocation features because of doubts over how information about their location might be used by app developers. A recent survey [@punchtab] showed that 50% of mobile users were reluctant to share their location due to privacy concerns. However, the same survey showed that the biggest reason given (88%) for users to allow location tracking was the availability of "coupons or special offers". This suggests that users will be prepared to allow _halfpricesushi_ to access their location because it will provide them with such offers. However, a fallback option ([FR04](#fr04-allow-user-to-specify-location-manually)) should be provided to support those users who decline to enable gelocation.


#### FR02: Show offers based on remaining duration

#### FR03: Display detailed information about each offer and location

#### FR04: Allow user to specify location manually

### Non-functional

Non-functional requirements are other qualities that the product must have in order to be acceptable to the user [@robertson2012]. These may include such properties as security, capacity, performance and compliance to standards. They can also be described as constraints placed on the system [@arlow].

#### NFR01: Respond to all user interactions within 100ms

#### NFR02: Support multiple languages

# Prototype

# Architecture

# Development

# Testing

# References
