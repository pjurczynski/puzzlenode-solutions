@routes
Feature: When I am on the airport A
  I want to be able to check where can I go from there

Scenario:
  Given I am on the airport "A" at "00:00"
  And I know the "0" flights table
  When I ask about what are possible routes for me
  Then I should know that I can go to "B" at "09:00"
  And I should know that I can go to "Z" at "10:00"
