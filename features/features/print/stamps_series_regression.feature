Feature: Stamps Series Regression



  Background:
    Given I am signed in as a postage shipper

  @wp_netstamps_regression
  @wp_netstamps_a_series

  Scenario: Stamps Regression A Series
    Then Postage: Select Stamps
    Then Postage Stamps: Set Serial Number to A12345
    Then Postage Stamps: Select Specify Postage Amount
    Then Postage Stamps: Set Ship-From to default
    Then Postage Stamps: Set Ship-To country to United States
    Then Postage Stamps: Select Calculate Postage Service First-Class Mail Letter
    Then Postage Stamps: Set Stamp Amount to $0.10
    Then Postage Stamps: Set Quantity to 1
    Then Postage Stamps: Set Cost Code to None
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out

  @wp_netstamps_regression
  @wp_netstamps_b_series

  Scenario: Stamps Regression B Series
    Then Postage: Select Stamps
    Then Postage Stamps: Set Serial Number to B12345
    Then Postage Stamps: Select Specify Postage Amount
    Then Postage Stamps: Set Ship-From to default
    Then Postage Stamps: Set Ship-To country to United States
    Then Postage Stamps: Select Calculate Postage Service First-Class Mail Letter
    Then Postage Stamps: Set Stamp Amount to $0.20
    Then Postage Stamps: Set Quantity to 2
    Then Postage Stamps: Set Cost Code to None
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out

  @wp_netstamps_regression
  @wp_netstamps_c_series

  Scenario: Stamps Regression C Series
    Then Postage: Select Stamps
    Then Postage Stamps: Set Serial Number to C12345
    Then Postage Stamps: Select Specify Postage Amount
    Then Postage Stamps: Set Ship-From to default
    Then Postage Stamps: Set Ship-To country to United States
    Then Postage Stamps: Select Calculate Postage Service First-Class Mail Letter
    Then Postage Stamps: Set Stamp Amount to $0.445
    Then Postage Stamps: Set Quantity to 3
    Then Postage Stamps: Set Cost Code to None
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out

  @wp_netstamps_regression
  @wp_netstamps_k_series

  Scenario: Stamps Regression K Series
    Then Postage: Select Stamps
    Then Postage Stamps: Set Serial Number to K12345
    Then Postage Stamps: Select Specify Postage Amount
    Then Postage Stamps: Set Ship-From to default
    Then Postage Stamps: Set Ship-To country to United States
    Then Postage Stamps: Select Calculate Postage Service First-Class Mail Letter
    Then Postage Stamps: Set Stamp Amount to $0.50
    Then Postage Stamps: Set Quantity to 4
    Then Postage Stamps: Set Cost Code to None
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out

  @wp_netstamps_regression
  @wp_netstamps_ml_series

  Scenario: Stamps Regression ML Series
    Then Postage: Select Stamps
    Then Postage Stamps: Set Serial Number to ML2345
    Then Postage Stamps: Select Specify Postage Amount
    Then Postage Stamps: Set Ship-From to default
    Then Postage Stamps: Set Ship-To country to United States
    Then Postage Stamps: Select Calculate Postage Service First-Class Mail Letter
    Then Postage Stamps: Set Stamp Amount to $1.65
    Then Postage Stamps: Set Quantity to 5
    Then Postage Stamps: Set Cost Code to None
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out

  @wp_netstamps_regression
  @wp_netstamps_p_series

  Scenario: Stamps Regression P Series
    Then Postage: Select Stamps
    Then Postage Stamps: Set Serial Number to P12345
    Then Postage Stamps: Select Specify Postage Amount
    Then Postage Stamps: Set Ship-From to default
    Then Postage Stamps: Set Ship-To country to United States
    Then Postage Stamps: Select Calculate Postage Service First-Class Mail Letter
    Then Postage Stamps: Set Stamp Amount to $1.995
    Then Postage Stamps: Set Quantity to 4
    Then Postage Stamps: Set Cost Code to None
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out

  @wp_netstamps_regression
  @wp_netstamps_r_series

  Scenario: Stamps Regression R Series
    Then Postage: Select Stamps
    Then Postage Stamps: Set Serial Number to R12345
    Then Postage Stamps: Select Specify Postage Amount
    Then Postage Stamps: Set Ship-From to default
    Then Postage Stamps: Set Ship-To country to United States
    Then Postage Stamps: Select Calculate Postage Service First-Class Mail Letter
    Then Postage Stamps: Set Stamp Amount to $2.15
    Then Postage Stamps: Set Quantity to 3
    Then Postage Stamps: Set Cost Code to None
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out


  @wp_netstamps_regression
  @wp_netstamps_v_series

  Scenario: Stamps Regression V Series
    Then Postage: Select Stamps
    Then Postage Stamps: Set Serial Number to V12345
    Then Postage Stamps: Select Specify Postage Amount
    Then Postage Stamps: Set Ship-From to default
    Then Postage Stamps: Set Ship-To country to United States
    Then Postage Stamps: Select Calculate Postage Service First-Class Mail Letter
    Then Postage Stamps: Set Stamp Amount to $4.65
    Then Postage Stamps: Set Quantity to 2
    Then Postage Stamps: Set Cost Code to None
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out

  @wp_netstamps_regression
  @wp_netstamps_wn_series

  Scenario: Stamps Regression WN Series
    Then Postage: Select Stamps
    Then Postage Stamps: Set Serial Number to WN2345
    Then Postage Stamps: Select Specify Postage Amount
    Then Postage Stamps: Set Ship-From to default
    Then Postage Stamps: Set Ship-To country to United States
    Then Postage Stamps: Select Calculate Postage Service First-Class Mail Letter
    Then Postage Stamps: Set Stamp Amount to $6.255
    Then Postage Stamps: Set Quantity to 1
    Then Postage Stamps: Set Cost Code to None
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out

  @wp_netstamps_regression
  @wp_netstamps_l_series

  Scenario: Stamps Regression L Series
    Then Postage: Select Stamps
    Then Postage Stamps: Set Serial Number to L12345
    Then Postage Stamps: Select Specify Postage Amount
    Then Postage Stamps: Set Ship-From to default
    Then Postage Stamps: Set Ship-To country to United States
    Then Postage Stamps: Select Calculate Postage Service First-Class Mail Letter
    Then Postage Stamps: Set Stamp Amount to $10.55
    Then Postage Stamps: Set Quantity to 2
    Then Postage Stamps: Set Cost Code to None
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out

  @wp_netstamps_regression
  @wp_netstamps_s_series

  Scenario: Stamps Regression S Series
    Then Postage: Select Stamps
    Then Postage Stamps: Set Serial Number to S12345
    Then Postage Stamps: Select Specify Postage Amount
    Then Postage Stamps: Set Ship-From to default
    Then Postage Stamps: Set Ship-To country to United States
    Then Postage Stamps: Select Calculate Postage Service First-Class Mail Letter
    Then Postage Stamps: Set Stamp Amount to $12.65
    Then Postage Stamps: Set Quantity to 1
    Then Postage Stamps: Set Cost Code to None
    Then Postage: Open Print Modal
    Then Postage Print Modal: Select Printer "factory"
    Then Postage Print Modal: Print
    Then Sign out
