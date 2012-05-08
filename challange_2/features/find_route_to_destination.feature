@routes
Feature: In order to take trips I need to find a route from my airport to my final destination airport.

Scenario: I want to know the cost and duration from airport A to airport Z
  Given I am on the airport "A" at "00:00"
  And I know the "0" flights table
  When I find avalaible routes to airport "Z"
  Then I know the duration and the cost of the flight
