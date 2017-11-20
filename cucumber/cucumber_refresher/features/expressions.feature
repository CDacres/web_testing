Feature: cucumber expressions
  As a user I want to see how cucmber scenarios work

  Scenario: I am able to utilise tables
    Given I provide an integer number of 3
    Then I will have 3 types of this veg in my belly:
    |   veg   | num |
    |cucumber |  1  |
    |courgette|  2  |
    |  leek   |  3  |

  Scenario: I am able to utilise integers
    Given I provide an integer of 3
    Then I will have 3 cucumbers in my belly

  Scenario: I am able to utilise floats
    Given I provide a float of 4.5
    Then I will have 4.5 aubergines in my belly

  Scenario: I am able to utilise words
    Given I provide a word of courgettes
    Then I will have courgettes in my belly

    @float_strings
  Scenario: I am able to utilise floats and strings
    Given I provide a float and string of 5.5 'spring onions'
    Then I will have 5.5 'spring onions' in my belly
