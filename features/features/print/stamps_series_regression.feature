Feature: Stamps Series Regression



  Background:
    Given I am signed in as a postage shipper

  @wp_netstamps_regression
  @wp_netstamps_a_series

  Scenario: Stamps Regression A Series
    Then Print Postage: Select Print On Stamps
    Then Stamps: Set Serial Number to A12345
    Then Stamps: Select Specify Postage Amount
    Then Stamps: Set Ship-From to default
    Then Stamps: Set Ship-To country to United States
    Then Stamps: Set Specify Postage Service to "First Class Mail (1 - 3 Days)"
    Then Stamps: Set Stamp Amount to $0.10
    Then Stamps: Set Quantity to 1
    Then Stamps: Set Cost Code to None
    Then Footer: Open Print Postage Modal
    Then Print: Select Postage Printer "factory"
    Then Footer: Print Postage
    Then Sign out

  @wp_netstamps_regression
  @wp_netstamps_b_series

  Scenario: Stamps Regression B Series
    Then Print Postage: Select Print On Stamps
    Then Stamps: Set Serial Number to B12345
    Then Stamps: Select Specify Postage Amount
    Then Stamps: Set Ship-From to default
    Then Stamps: Set Ship-To country to United States
    Then Stamps: Set Specify Postage Service to "First Class Mail (1 - 3 Days)"
    Then Stamps: Set Stamp Amount to $0.20
    Then Stamps: Set Quantity to 2
    Then Stamps: Set Cost Code to None
    Then Footer: Open Print Postage Modal
    Then Print: Select Postage Printer "factory"
    Then Footer: Print Postage
    Then Sign out

  @wp_netstamps_regression
  @wp_netstamps_c_series

  Scenario: Stamps Regression C Series
    Then Print Postage: Select Print On Stamps
    Then Stamps: Set Serial Number to C12345
    Then Stamps: Select Specify Postage Amount
    Then Stamps: Set Ship-From to default
    Then Stamps: Set Ship-To country to United States
    Then Stamps: Set Specify Postage Service to "First Class Mail (1 - 3 Days)"
    Then Stamps: Set Stamp Amount to $0.445
    Then Stamps: Set Quantity to 3
    Then Stamps: Set Cost Code to None
    Then Footer: Open Print Postage Modal
    Then Print: Select Postage Printer "factory"
    Then Footer: Print Postage
    Then Sign out

  @wp_netstamps_regression
  @wp_netstamps_k_series

  Scenario: Stamps Regression K Series
    Then Print Postage: Select Print On Stamps
    Then Stamps: Set Serial Number to K12345
    Then Stamps: Select Specify Postage Amount
    Then Stamps: Set Ship-From to default
    Then Stamps: Set Ship-To country to United States
    Then Stamps: Set Specify Postage Service to "First Class Mail (1 - 3 Days)"
    Then Stamps: Set Stamp Amount to $0.50
    Then Stamps: Set Quantity to 4
    Then Stamps: Set Cost Code to None
    Then Footer: Open Print Postage Modal
    Then Print: Select Postage Printer "factory"
    Then Footer: Print Postage
    Then Sign out

  @wp_netstamps_regression
  @wp_netstamps_ml_series

  Scenario: Stamps Regression ML Series
    Then Print Postage: Select Print On Stamps
    Then Stamps: Set Serial Number to ML2345
    Then Stamps: Select Specify Postage Amount
    Then Stamps: Set Ship-From to default
    Then Stamps: Set Ship-To country to United States
    Then Stamps: Set Specify Postage Service to "First Class Mail (1 - 3 Days)"
    Then Stamps: Set Stamp Amount to $1.65
    Then Stamps: Set Quantity to 5
    Then Stamps: Set Cost Code to None
    Then Footer: Open Print Postage Modal
    Then Print: Select Postage Printer "factory"
    Then Footer: Print Postage
    Then Sign out

  @wp_netstamps_regression
  @wp_netstamps_p_series

  Scenario: Stamps Regression P Series
    Then Print Postage: Select Print On Stamps
    Then Stamps: Set Serial Number to P12345
    Then Stamps: Select Specify Postage Amount
    Then Stamps: Set Ship-From to default
    Then Stamps: Set Ship-To country to United States
    Then Stamps: Set Specify Postage Service to "First Class Mail (1 - 3 Days)"
    Then Stamps: Set Stamp Amount to $1.995
    Then Stamps: Set Quantity to 4
    Then Stamps: Set Cost Code to None
    Then Footer: Open Print Postage Modal
    Then Print: Select Postage Printer "factory"
    Then Footer: Print Postage
    Then Sign out

  @wp_netstamps_regression
  @wp_netstamps_r_series

  Scenario: Stamps Regression R Series
    Then Print Postage: Select Print On Stamps
    Then Stamps: Set Serial Number to R12345
    Then Stamps: Select Specify Postage Amount
    Then Stamps: Set Ship-From to default
    Then Stamps: Set Ship-To country to United States
    Then Stamps: Set Specify Postage Service to "First Class Mail (1 - 3 Days)"
    Then Stamps: Set Stamp Amount to $2.15
    Then Stamps: Set Quantity to 3
    Then Stamps: Set Cost Code to None
    Then Footer: Open Print Postage Modal
    Then Print: Select Postage Printer "factory"
    Then Footer: Print Postage
    Then Sign out


  @wp_netstamps_regression
  @wp_netstamps_v_series

  Scenario: Stamps Regression V Series
    Then Print Postage: Select Print On Stamps
    Then Stamps: Set Serial Number to V12345
    Then Stamps: Select Specify Postage Amount
    Then Stamps: Set Ship-From to default
    Then Stamps: Set Ship-To country to United States
    Then Stamps: Set Specify Postage Service to "First Class Mail (1 - 3 Days)"
    Then Stamps: Set Stamp Amount to $4.65
    Then Stamps: Set Quantity to 2
    Then Stamps: Set Cost Code to None
    Then Footer: Open Print Postage Modal
    Then Print: Select Postage Printer "factory"
    Then Footer: Print Postage
    Then Sign out

  @wp_netstamps_regression
  @wp_netstamps_wn_series

  Scenario: Stamps Regression WN Series
    Then Print Postage: Select Print On Stamps
    Then Stamps: Set Serial Number to WN2345
    Then Stamps: Select Specify Postage Amount
    Then Stamps: Set Ship-From to default
    Then Stamps: Set Ship-To country to United States
    Then Stamps: Set Specify Postage Service to "First Class Mail (1 - 3 Days)"
    Then Stamps: Set Stamp Amount to $6.255
    Then Stamps: Set Quantity to 1
    Then Stamps: Set Cost Code to None
    Then Footer: Open Print Postage Modal
    Then Print: Select Postage Printer "factory"
    Then Footer: Print Postage
    Then Sign out

  @wp_netstamps_regression
  @wp_netstamps_l_series

  Scenario: Stamps Regression L Series
    Then Print Postage: Select Print On Stamps
    Then Stamps: Set Serial Number to L12345
    Then Stamps: Select Specify Postage Amount
    Then Stamps: Set Ship-From to default
    Then Stamps: Set Ship-To country to United States
    Then Stamps: Set Specify Postage Service to "First Class Mail (1 - 3 Days)"
    Then Stamps: Set Stamp Amount to $10.55
    Then Stamps: Set Quantity to 2
    Then Stamps: Set Cost Code to None
    Then Footer: Open Print Postage Modal
    Then Print: Select Postage Printer "factory"
    Then Footer: Print Postage
    Then Sign out

  @wp_netstamps_regression
  @wp_netstamps_s_series

  Scenario: Stamps Regression S Series
    Then Print Postage: Select Print On Stamps
    Then Stamps: Set Serial Number to S12345
    Then Stamps: Select Specify Postage Amount
    Then Stamps: Set Ship-From to default
    Then Stamps: Set Ship-To country to United States
    Then Stamps: Set Specify Postage Service to "First Class Mail (1 - 3 Days)"
    Then Stamps: Set Stamp Amount to $12.65
    Then Stamps: Set Quantity to 1
    Then Stamps: Set Cost Code to None
    Then Footer: Open Print Postage Modal
    Then Print: Select Postage Printer "factory"
    Then Footer: Print Postage
    Then Sign out
