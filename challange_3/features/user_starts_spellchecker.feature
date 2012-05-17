Feature: A user starts a SpellChecker
  As a user
  I want to start a SpellChecker
  So that I can check the words for the right spelling

  Scenario: I start the SpellCheck program
    Given I Have not yet started the SpellCheck program
    When I start it
    Then the program should say "Enter the word:"
