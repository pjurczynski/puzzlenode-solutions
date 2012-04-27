@flight
Feature: Get you from point A to point B
  If you want to travel from one city to another,
  You need to know the flights its 
  * start destination,
  * end destination,
  * start time,
  * end time,
  * where it goes,
  * and its cost.

  Scenario: You want to get from point A to point B
    Given a sample flight "A B 09:00 10:00 100.00"
    Then you know its details "A B 09:00 10:00 100.00"
