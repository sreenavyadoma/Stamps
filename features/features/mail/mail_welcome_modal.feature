Feature: First time Mail sign in

  Background:
    Given I launched default browser

  @mail_welcome_modal
  Scenario: What's new modal
    Then Visit Mail sign in page
    Then I am signed in as Mail shipper for the first time with credentials ccxkn50rcvcm/pass111
    Then What's New: Expect modal to be present
    Then What's new: Click More Info
    Then More Info: Expect More Info page is present
    Then More Info: Close More Info page
    Then What's New: Click Continue button
    Then Sign out