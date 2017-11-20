Feature: User Registration
As a new user
i want to be able to register

  Scenario Outline:  If I input incorrect password details I will receive the correct error message.
    Given I am on the bbc sign in page
    And I click the link to register
    When I input a valid date of birth
    And input an email and the password details <password>
    Then I receive the corresponding error <error>

    Examples:
    | password |                                  error                                          |
    | 1234     | Sorry, that password is too short. It needs to be eight characters or more.     |
    | abcdefgh | Sorry, that password isn't valid. Please include something that isn't a letter. |
