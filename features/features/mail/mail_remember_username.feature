Feature: Remember Username

  Background:
    #Given I am signed in as a postage shipper
    Given I launched the default browser

  @mail_remember_username
  Scenario: Remember Username
    Then I visit postage sign-in page
    Then Mail Sign In: Set Remember Username to Checked
    Then Sign out
    Then Mail Sign In: Check Remember Username
    Then Mail Sign In: Expect Remember Username is checked

  @mail_remember_username
  Scenario: Forget Username
    Then I visit postage sign-in page
    Then Mail Sign In: Set Remember Username to Unchecked
    Then Sign out
    Then Mail Sign In: Check Remember Username
    Then Postage Sign In: Expect Remember Username is unchecked
