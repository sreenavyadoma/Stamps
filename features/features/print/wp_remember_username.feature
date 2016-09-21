Feature: Remember Username

  Background:
    #Given I am signed in as a postage shipper
    Given I launched the default browser

  @wp_remember_username
  Scenario: Remember Username
    Then I visit postage sign-in page
    Then Postage Sign In: Set Remember Username to Checked
    Then Sign out
    Then Postage Sign In: Check Remember Username
    Then Postage Sign In: Expect Remember Username is checked

  @wp_remember_username
  Scenario: Forget Username
    Then I visit postage sign-in page
    Then Postage Sign In: Set Remember Username to Unchecked
    Then Sign out
    Then Postage Sign In: Check Remember Username
    Then Postage Sign In: Expect Remember Username is unchecked
