# features/login.feature

Feature: User login

  Scenario: Log in to the system
    Given a user with email "test@example.com" and a password of "secret"
    And I am not logged in
    When I go to the log in page
    And I fill in "user_email" with "test@example.com" 
    And I fill in "user_password" with "secret"
    And I press "Login"
    Then I should see "This is ChatChat!"
