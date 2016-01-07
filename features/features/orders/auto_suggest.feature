
Feature: As a batch shipper, I want to be able to use auto suggest to fill out address forms [B-01607]

  Background:
    Given I am signed in as batch shipper autosuggest/326tsetaqcdS!

  @auto_suggest
  Scenario: Select Domestic Address

    When I Add a new order

    #Matching first name

    Then Set Order Details Form Ship-To address to San

    Then Expect Auto Suggest name shows Sandy Jones for entry 2
    And Expect Auto Suggest location shows El Segundo, CA, United States for entry 2

    Then Select entry 2 in the auto suggest drop down list



    Then Set Order Details Form Pounds to 0
    And Expect Domestic Address field displays Sandy Jones, 1970 E. Grand Ave Ste 200, El Segundo, CA 90245-5018

    #Matching last name

    Then Set Order Details Form Ship-To address to San

    Then Expect Auto Suggest name shows Mark Sanchez for entry 3
    And Expect Auto Suggest location shows El Segundo, CA, United States for entry 3

    Then Select entry 3 in the auto suggest drop down list
    Then Set Order Details Form Pounds to 0
    And Expect Domestic Address field displays Mark Sanchez, 1970 E. Grand Ave Ste. 330, El Segundo, CA 90245-5038

    #Matching City


    Then Set Order Details Form Ship-To address to San

    Then Expect Auto Suggest name shows James Jones for entry 1
    And Expect Auto Suggest location shows San Diego, CA, United States for entry 1

    Then Select entry 1 in the auto suggest drop down list
    Then Set Order Details Form Pounds to 0
    And Expect Domestic Address field displays James Jones, 600 Front St Apt 220, San Diego, CA 92101-6733
    Then Expect Domestic Phone field displays 5885559999
    Then Expect Domestic Email field displays autosuggest@stamps.com

    #Matching Company

    Then Set Order Details Form Ship-To address to San

    Then Expect Auto Suggest name shows Albert Test, Santos Marketing for entry 4
    Then Expect Auto Suggest location shows El Segundo, CA, United States for entry 4

    Then Select entry 4 in the auto suggest drop down list
    Then Set Order Details Form Pounds to 0
    And Expect Domestic Address field displays Albert Test, Santos Marketing, 1970 E. Grand Ave Ste 330, El Segundo, CA 90245-5038

    #Matching Zip Code

    Then Set Order Details Form Ship-To address to 794

    Then Expect Auto Suggest name shows Fred Davidson for entry 1
    Then Expect Auto Suggest location shows Lubbock, TX, United States for entry 1

    Then Select entry 1 in the auto suggest drop down list

    And Expect Domestic Address field displays Fred Davidson, 5912 83rd St, Lubbock, TX 79424-3608

    #Matching address1

    Then Set Order Details Form Ship-To address to 591

    Then Expect Auto Suggest name shows Fred Davidson for entry 1
    Then Expect Auto Suggest location shows Lubbock, TX, United States for entry 1

    Then Select entry 1 in the auto suggest drop down list
    Then Set Order Details Form Pounds to 0
    And Expect Domestic Address field displays Fred Davidson, 5912 83rd St, Lubbock, TX 79424-3608

    #Matching address2

    Then Set Order Details Form Ship-To address to 330

    Then Expect Auto Suggest name shows Mark Sanchez for entry 1
    And Expect Auto Suggest location shows El Segundo, CA, United States for entry 1

    Then Select entry 1 in the auto suggest drop down list
    Then Set Order Details Form Pounds to 0
    And Expect Domestic Address field displays Mark Sanchez, 1970 E. Grand Ave Ste. 330, El Segundo, CA 90245-5038

    #Matching country

    Then Set Order Details Form Ship-To address to Uni

    Then Expect Auto Suggest name shows James Jones for entry 3
    And Expect Auto Suggest location shows San Diego, CA, United States for entry 3

    Then Select entry 3 in the auto suggest drop down list
    Then Set Order Details Form Pounds to 0
    And Expect Domestic Address field displays James Jones, 600 Front St Apt 220, San Diego, CA 92101-6733

    Then Sign out


  @auto_suggest
  Scenario: Select International Address

    When I Add a new order

    Then Set Order Details Form Ship-To country to Cuba

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





#todo Rob
