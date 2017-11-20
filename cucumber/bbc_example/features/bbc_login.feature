Feature: User Login
As a user
i want to be able to login to the bbc site

  Scenario: If I log in with invalid credentials I receive a valid error
    Given I am on the sign in page
    When I input invalid login credentials
    And I click login
    Then I receive a valid error

  @test
  Scenario: If I input an incorrect password when logging in I receive a password error
    Given I am on the sign in page
    When I input a valid username
    And I input an invalid password
    And I click login
    Then I receive a valid password error
