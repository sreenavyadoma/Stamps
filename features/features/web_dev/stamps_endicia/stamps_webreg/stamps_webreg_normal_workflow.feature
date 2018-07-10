Feature: Stamps WebReg: Normal Workflow
  Background:
    Given Start test driver

  @sdcwr_normal_workflow
  Scenario: Stamps WebReg: Normal Workflow
    Then WebReg: navigates to default registration page
    Then SDCWR: set profile page email to adb@stamps.com
    Then SDCWR: set Profile page Survey Question to Business Use - Mostly mailing (letters/postcards/flats)
    Then SDCWR: set Profile page Survey Question to Individual