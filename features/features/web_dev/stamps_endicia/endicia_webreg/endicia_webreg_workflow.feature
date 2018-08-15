Feature: Endicia WebReg: Profile Page

  Background:
    Given Start test driver

  @ewwr_offer_707_workflow
  Scenario: Endicia WebReg: Default Offer 707 Print Landing Page Workflow
    Then WL: navigates to default registration page for endicia with the following offer id 707

    Then WL: set profile page default values
    Then WL: click profile page continue button

    Then WL: set membership page default values
    Then WL: click membership page submit button

    Then WL: select security questions first security question What is your father's birthplace?
    Then WL: set security questions first security answer to Los Angeles
    Then WL: select security questions second security question What was your high school mascot?
    Then WL: set security questions second security answer to Tigar

    Then WL: click security questions get started button

    Then WL: expect user is navigated to print page


