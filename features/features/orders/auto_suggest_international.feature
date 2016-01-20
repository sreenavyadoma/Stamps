
Feature: As a batch shipper, I want to be able to use auto suggest to fill out address forms [B-01607]

  Background:
    Given I am signed in to Orders


  @auto_suggest
  Scenario: Select International Address

    Then Add New Order

    Then Order Details - Set Form Ship-To country to Cuba

    #Matching first name

    Then Set International Ship-To Name to "Jac"

    Then Expect Auto Suggest name shows Jackie Frank for entry 1
    And Expect Auto Suggest location shows Juniper, Republic Of The Congo for entry 1

    Then Select entry 1 in the auto suggest drop down list

    Then Expect International Ship-To Country field displays Republic Of The Congo
    Then Expect International Ship-To Address 1 field displays 99021 Match Ln
    Then Expect International Ship-To City field displays Juniper
    Then Expect International Ship-To Postal Code field displays OI992


    #Matching last name

    Then Set International Ship-To Name to "Fra"

    Then Expect Auto Suggest name shows Henry Franklin, Test Company for entry 2
    And Expect Auto Suggest location shows London, Test, Great Britain for entry 2

    Then Select entry 2 in the auto suggest drop down list

    Then Expect International Ship-To Country field displays Great Britain
    And Expect International Ship-To Address 1 field displays 12133 Monarchy Rd
    Then Expect International Ship-To City field displays London
    Then Expect International Ship-To Province field displays Test
    And Expect International Ship-To Postal Code field displays 121SSD
    Then Expect International Ship-To Phone field displays 8885551212
    And Expect International Ship-To Email field displays england@stamps.com

    #Matching City

    Then Set International Ship-To Name to "Jun"

    Then Expect Auto Suggest name shows Jackie Frank for entry 1
    And Expect Auto Suggest location shows Juniper, Republic Of The Congo for entry 1

    Then Select entry 1 in the auto suggest drop down list

    Then Expect International Ship-To Country field displays Republic Of The Congo
    Then Expect International Ship-To Address 1 field displays 99021 Match Ln
    Then Expect International Ship-To City field displays Juniper
    Then Expect International Ship-To Postal Code field displays OI992

    #Matching Company

    Then Set International Ship-To Name to "Tes"

    Then Expect Auto Suggest name shows Henry Franklin, Test Company for entry 2
    And Expect Auto Suggest location shows London, Test, Great Britain for entry 2

    Then Select entry 2 in the auto suggest drop down list

    Then Expect International Ship-To Country field displays Great Britain
    And Expect International Ship-To Address 1 field displays 12133 Monarchy Rd
    Then Expect International Ship-To City field displays London
    Then Expect International Ship-To Province field displays Test
    And Expect International Ship-To Postal Code field displays 121SSD
    Then Expect International Ship-To Phone field displays 8885551212
    And Expect International Ship-To Email field displays england@stamps.com

    #Matching address1

    Then Set International Ship-To Name to "990"

    Then Expect Auto Suggest name shows Jacque Snow for entry 3
    And Expect Auto Suggest location shows Toronto, ON, Canada for entry 3

    Then Select entry 3 in the auto suggest drop down list

    Then Expect International Ship-To Country field displays Canada
    And Expect International Ship-To Address 1 field displays 9902 Maple Rd
    Then Expect International Ship-To Address 2 field displays Ste 221
    Then Expect International Ship-To City field displays Toronto
    Then Expect International Ship-To Province field displays ON
    Then Expect International Ship-To Postal Code field displays M4B 1B3

    #Matching address2

    Then Set International Ship-To Name to "221"

    Then Expect Auto Suggest name shows Jacque Snow for entry 1
    And Expect Auto Suggest location shows Toronto, ON, Canada for entry 1

    Then Select entry 1 in the auto suggest drop down list

    Then Expect International Ship-To Country field displays Canada
    And Expect International Ship-To Address 1 field displays 9902 Maple Rd
    Then Expect International Ship-To Address 2 field displays Ste 221
    Then Expect International Ship-To City field displays Toronto
    Then Expect International Ship-To Province field displays ON
    Then Expect International Ship-To Postal Code field displays M4B 1B3

    #Matching country

    Then Set International Ship-To Name to "Gre"

    Then Expect Auto Suggest name shows Henry Franklin, Test Company for entry 1
    And Expect Auto Suggest location shows London, Test, Great Britain for entry 1

    Then Select entry 1 in the auto suggest drop down list

    Then Expect International Ship-To Country field displays Great Britain
    And Expect International Ship-To Address 1 field displays 12133 Monarchy Rd
    Then Expect International Ship-To City field displays London
    Then Expect International Ship-To Province field displays Test
    And Expect International Ship-To Postal Code field displays 121SSD
    Then Expect International Ship-To Phone field displays 8885551212
    And Expect International Ship-To Email field displays england@stamps.com

    Then Sign out


#todo-rob
