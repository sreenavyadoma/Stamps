Feature: SDCWR: Normal Workflow
  Background:
    Given Start test driver

  @sdcwr_normal_workflow
  Scenario: SDCWR: Normal Workflow
    Then SDCWR: navigates to default registration page
    Then SDCWR: profile page enter email