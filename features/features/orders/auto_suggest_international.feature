
Feature: As a batch shipper, I want to be able to use auto suggest to fill out address forms [B-01607]

  Background:
    Given I am signed in to Orders


  @auto_suggest_dev
  Scenario: Select International Address

    Then Add New Order

    Then Order Details: Set Ship-To Country to Cuba

    #Matching first name

    Then Set International Ship-To Name to "Jac"

    Then Expect Auto Suggest name shows Jackie Frank for entry 1
    And Expect Auto Suggest location shows Juniper, Republic Of The Congo for entry 1

    Then Select entry 1 in the auto suggest drop down list

    Then Order Details: Expect International Ship-To Country to be Republic Of The Congo
    Then Order Details: Expect International Ship-To Address 1 to be 99021 Match Ln
    Then Order Details: Expect International Ship-To City to be Juniper
    Then Order Details: Expect International Ship-To Postal Code to be OI992

    #Matching last name

    Then Set International Ship-To Name to "Fra"

    Then Expect Auto Suggest name shows Henry Franklin, Test Company for entry 2
    And Expect Auto Suggest location shows London, Test, Great Britain for entry 2

    Then Select entry 2 in the auto suggest drop down list

    Then Order Details: Expect International Ship-To Country to be Great Britain
    Then Order Details: Expect International Ship-To Address 1 to be 12133 Monarchy Rd
    Then Order Details: Expect International Ship-To City to be London
    Then Order Details: Expect International Ship-To Province to be Test
    Then Order Details: Expect International Ship-To Postal Code to be 121SSD
    Then Order Details: Expect International Ship-To Phone to be 8885551212
    Then Order Details: Expect International Ship-To Email to be england@stamps.com

    #Matching City

    Then Set International Ship-To Name to "Jun"

    Then Expect Auto Suggest name shows Jackie Frank for entry 1
    And Expect Auto Suggest location shows Juniper, Republic Of The Congo for entry 1

    Then Select entry 1 in the auto suggest drop down list

    Then Order Details: Expect International Ship-To Country to be Republic Of The Congo
    Then Order Details: Expect International Ship-To Address 1 to be 99021 Match Ln
    Then Order Details: Expect International Ship-To City to be Juniper
    Then Order Details: Expect International Ship-To Postal Code to be OI992

    #Matching Company

    Then Set International Ship-To Name to "Tes"

    Then Expect Auto Suggest name shows Henry Franklin, Test Company for entry 2
    And Expect Auto Suggest location shows London, Test, Great Britain for entry 2

    Then Select entry 2 in the auto suggest drop down list

    Then Order Details: Expect International Ship-To Country to be Great Britain
    Then Order Details: Expect International Ship-To Address 1 to be 12133 Monarchy Rd
    Then Order Details: Expect International Ship-To City to be London
    Then Order Details: Expect International Ship-To Province to be Test
    Then Order Details: Expect International Ship-To Postal Code to be 121SSD
    Then Order Details: Expect International Ship-To Phone to be 8885551212
    Then Order Details: Expect International Ship-To Email to be england@stamps.com

    #Matching address1

    Then Set International Ship-To Name to "990"

    Then Expect Auto Suggest name shows Jacque Snow for entry 3
    And Expect Auto Suggest location shows Toronto, ON, Canada for entry 3

    Then Select entry 3 in the auto suggest drop down list

    Then Order Details: Expect International Ship-To Country to be Canada
    Then Order Details: Expect International Ship-To Address 1 to be 9902 Maple Rd
    Then Order Details: Expect International Ship-To Address 2 to be Ste 221
    Then Order Details: Expect International Ship-To City to be Toronto
    Then Order Details: Expect International Ship-To Province to be ON
    Then Order Details: Expect International Ship-To Postal Code to be M4B 1B3

    #Matching address2

    Then Set International Ship-To Name to "221"

    Then Expect Auto Suggest name shows Jacque Snow for entry 1
    And Expect Auto Suggest location shows Toronto, ON, Canada for entry 1

    Then Select entry 1 in the auto suggest drop down list

    Then Order Details: Expect International Ship-To Country to be Canada
    Then Order Details: Expect International Ship-To Address 1 to be 9902 Maple Rd
    Then Order Details: Expect International Ship-To Address 2 to be Ste 221
    Then Order Details: Expect International Ship-To City to be Toronto
    Then Order Details: Expect International Ship-To Province to be ON
    Then Order Details: Expect International Ship-To Postal Code to be M4B 1B3

    #Matching country

    Then Set International Ship-To Name to "Gre"

    Then Expect Auto Suggest name shows Henry Franklin, Test Company for entry 1
    And Expect Auto Suggest location shows London, Test, Great Britain for entry 1

    Then Select entry 1 in the auto suggest drop down list

    Then Order Details: Expect International Ship-To Country to be Great Britain
    Then Order Details: Expect International Ship-To Address 1 to be 12133 Monarchy Rd
    Then Order Details: Expect International Ship-To City to be London
    Then Order Details: Expect International Ship-To Province to be Test
    Then Order Details: Expect International Ship-To Postal Code to be 121SSD
    Then Order Details: Expect International Ship-To Phone to be 8885551212
    Then Order Details: Expect International Ship-To Email to be england@stamps.com

    Then Sign out


#todo-rob
