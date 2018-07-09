Feature: SDCWR: Normal Workflow
  Background:
    Given Start test driver

  @webreg_normal_workflow
  Scenario: SDCWR: Normal Workflow
    Then SDCWR: navigates to the stamps website
    Then SDCWR: click the GET STARTED button
