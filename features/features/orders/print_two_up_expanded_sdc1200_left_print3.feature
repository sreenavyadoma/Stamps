Feature: User Prints 3 Domestic labels on SDC-1200 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: User Prints 3 Domestic labels on SDC-1200 - left side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PM Med FR Box, SDC-1200, 530 K Street Unit 504, San Diego CA 92101-7060
    Then Set Order Details Service to "Priority Mail Medium Flat Rate Box"
    Then Set Order Details Ounces to 1
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PM Lg FR Box, SDC-1200, 7065 N Ingram Ave, Fresno CA 93650-1083
    Then Set Order Details Service to "Priority Mail Large Flat Rate Box"
    Then Set Order Details Ounces to 1
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to PM RR Box A, SDC-1200, 4937 79th St., Sacramento CA 95820-6213
    Then Set Order Details Service to "Priority Mail Regional Rate Box A"
    Then Set Order Details Ounces to 1
    Then Check Orders Grid row 1
    Then Check Orders Grid row 2
    Then Check Orders Grid row 3
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    Then Print Sample
    Then Print

    Then Sign out
