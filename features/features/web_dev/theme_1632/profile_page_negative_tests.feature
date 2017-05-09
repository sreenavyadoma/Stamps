Feature: Profile page negative tests

  Background:
    Given I loaded SDC Website

  @registration_profile_page_negative_tests
  Scenario: Profile Page negative tests
    Then click on Get Started
    Then Pause for 2 seconds
    Then click Profile Page Continue button
    Then expect Profile Page Email help text is This field is required
    Then expect Profile Page Username help text is This field is required

    Then set Profile Page Email to s
    Then blur out of Profile Page
    Then expect Profile Page Email help text 1 is 5 character minimum
    Then expect Profile Page Email help text 2 is Valid email address required