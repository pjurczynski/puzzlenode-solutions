Feature: A user enters a word to the spellchecker
  As a User
  I want to enter a word to the spellchecker
  So that I would get a feedback as if I had entered the word correctly

  Scenario Outline: enter a word
    Given the suggestions "<suggestion_one>" and "<suggestion_two>"
    When I enter a word "<word>"
    Then the corrected word shuold be "<corrected>"

  Scenarios: I enter a misspelled word
    | suggestion_one | suggestion_two | word       | corrected    |
    | nom            | numb           | numm       | numb         |
    | reminiscence   | remembrance    | remimance  | remembrance  |
    | immediately    | incidentally   | inndietlly | incidentally |

