@flight_table
Feature: I can read a flight table

Scenario: I can read everything from the flight table
  Given a table in "data/sample/sample-input.txt"
  When I read it
  And I get the "0" test case
  Then I should know what's in it
