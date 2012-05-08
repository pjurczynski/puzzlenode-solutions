@routes @best
Feature: In order to fly responsibly when I find the cheapest or the shortest route, I also want to find out if that route has some alternatives that suits me better

  Scenario: I want to find the cheapest route and then the shortest
    Given a "0" flight table with all routes from "A" to "Z" starting at "00:00"
    When calculate the cheapest way
    And find shortest alternatives
    Then I know that the cheapest route from "A" to "Z" is "200.00"
    And the duration is "270"

  Scenario: I want to find the shortest route and then the cheapest
    Given a "0" flight table with all routes from "A" to "Z" starting at "00:00"
    When calculate the shortest way
    And find cheapest alternatives
    Then I know that the shortest route from "A" to "Z" is "120"
    And the cost is "300.00"

  Scenario: I want to find the cheapest route and then the shortest
    Given a "1" flight table with all routes from "A" to "Z" starting at "00:00"
    When calculate the cheapest way
    And find shortest alternatives
    Then I know that the cheapest route from "A" to "Z" is "225.00"
    And the duration is "660"

  Scenario: I want to find the shortest route and then the cheapest
    Given a "1" flight table with all routes from "A" to "Z" starting at "00:00"
    When calculate the shortest way
    And find cheapest alternatives
    Then I know that the shortest route from "A" to "Z" is "270"
    And the cost is "550.00"
