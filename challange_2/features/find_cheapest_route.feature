@route @cheapest
Feature: I want to find the cheapest route for today

  Scenario:
    Given a "0" flight table with all routes from "A" to "Z" starting at "00:00"
    When calculate the cheapest way
    Then I know that the cheapest route from "A" to "Z" is "200.00"

  Scenario:
    Given a "1" flight table with all routes from "A" to "Z" starting at "00:00"
    When calculate the cheapest way
    Then I know that the cheapest route from "A" to "Z" is "225.00"
