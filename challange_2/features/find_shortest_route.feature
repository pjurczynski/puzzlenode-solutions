@route @shortest
Feature: I want to find the shortest route for today

  Scenario:
    Given a "0" flight table with all routes from "A" to "Z" starting at "00:00"
    When calculate the shortest way
    Then I know that the shortest route from "A" to "Z" is "120"

  Scenario:
    Given a "1" flight table with all routes from "A" to "Z" starting at "00:00"
    When calculate the shortest way
    Then I know that the shortest route from "A" to "Z" is "270"
