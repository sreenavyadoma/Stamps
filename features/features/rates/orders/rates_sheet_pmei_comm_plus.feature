Feature: PMEI Comm Plus Rates

  Background:
    Given excel rate sheet is loaded

  @rates_pmei_comm_plus
  Scenario: PMEI Comm Plus
    And a valid user is signed in to Web Apps
    Then add new order
    Then set Order Details form Ship-From to default
    Then run rate test PMEI Comm Plus in Country Price Group 1
    Then run rate test PMEI Comm Plus in Country Price Group 2
    Then run rate test PMEI Comm Plus in Country Price Group 3
    Then run rate test PMEI Comm Plus in Country Price Group 4
    Then run rate test PMEI Comm Plus in Country Price Group 5
    Then run rate test PMEI Comm Plus in Country Price Group 6
    Then run rate test PMEI Comm Plus in Country Price Group 7
    Then run rate test PMEI Comm Plus in Country Price Group 8
    Then run rate test PMEI Comm Plus in Country Price Group 9
    Then run rate test PMEI Comm Plus in Country Price Group 10
    Then run rate test PMEI Comm Plus in Country Price Group 11
    Then run rate test PMEI Comm Plus in Country Price Group 12
    Then run rate test PMEI Comm Plus in Country Price Group 13
    Then run rate test PMEI Comm Plus in Country Price Group 14
    Then run rate test PMEI Comm Plus in Country Price Group 15
    Then run rate test PMEI Comm Plus in Country Price Group 16
    Then run rate test PMEI Comm Plus in Country Price Group 17
    Then Rates: Number of failed test should be less than 1
    Then Sign out