
Feature: As a batch shipper, I want to be able to use auto suggest to fill out address forms [B-01607]

  Background:
    Given I am signed in to Orders

  @auto_suggest
  Scenario: Select Domestic Address

    When Add New Order

    #Matching first name

    Then Order Details - Set Form Ship-To address to San

    Then Expect Auto Suggest name shows Sandy Jones for entry 2
    And Expect Auto Suggest location shows El Segundo, CA, United States for entry 2

    Then Select entry 2 in the auto suggest drop down list



    Then Order Details - Set Form Pounds to 0
    And Expect Domestic Address field displays Sandy Jones, 1970 E. Grand Ave Ste 200, El Segundo, CA 90245-5018

    #Matching last name

    Then Order Details - Set Form Ship-To address to San

    Then Expect Auto Suggest name shows Mark Sanchez for entry 3
    And Expect Auto Suggest location shows El Segundo, CA, United States for entry 3

    Then Select entry 3 in the auto suggest drop down list
    Then Order Details - Set Form Pounds to 0
    And Expect Domestic Address field displays Mark Sanchez, 1970 E. Grand Ave Ste. 330, El Segundo, CA 90245-5038

    #Matching City


    Then Order Details - Set Form Ship-To address to San

    Then Expect Auto Suggest name shows James Jones for entry 1
    And Expect Auto Suggest location shows San Diego, CA, United States for entry 1

    Then Select entry 1 in the auto suggest drop down list
    Then Order Details - Set Form Pounds to 0
    And Expect Domestic Address field displays James Jones, 600 Front St Apt 220, San Diego, CA 92101-6733
    Then Expect Domestic Phone field displays 5885559999
    Then Expect Domestic Email field displays autosuggest@stamps.com

    #Matching Company

    Then Order Details - Set Form Ship-To address to San

    Then Expect Auto Suggest name shows Albert Test, Santos Marketing for entry 4
    Then Expect Auto Suggest location shows El Segundo, CA, United States for entry 4

    Then Select entry 4 in the auto suggest drop down list
    Then Order Details - Set Form Pounds to 0
    And Expect Domestic Address field displays Albert Test, Santos Marketing, 1970 E. Grand Ave Ste 330, El Segundo, CA 90245-5038

    #Matching Zip Code

    Then Order Details - Set Form Ship-To address to 794

    Then Expect Auto Suggest name shows Fred Davidson for entry 1
    Then Expect Auto Suggest location shows Lubbock, TX, United States for entry 1

    Then Select entry 1 in the auto suggest drop down list

    And Expect Domestic Address field displays Fred Davidson, 5912 83rd St, Lubbock, TX 79424-3608

    #Matching address1

    Then Order Details - Set Form Ship-To address to 591

    Then Expect Auto Suggest name shows Fred Davidson for entry 1
    Then Expect Auto Suggest location shows Lubbock, TX, United States for entry 1

    Then Select entry 1 in the auto suggest drop down list
    Then Order Details - Set Form Pounds to 0
    And Expect Domestic Address field displays Fred Davidson, 5912 83rd St, Lubbock, TX 79424-3608

    #Matching address2

    Then Order Details - Set Form Ship-To address to 330

    Then Expect Auto Suggest name shows Mark Sanchez for entry 1
    And Expect Auto Suggest location shows El Segundo, CA, United States for entry 1

    Then Select entry 1 in the auto suggest drop down list
    Then Order Details - Set Form Pounds to 0
    And Expect Domestic Address field displays Mark Sanchez, 1970 E. Grand Ave Ste. 330, El Segundo, CA 90245-5038

    #Matching country

    Then Order Details - Set Form Ship-To address to Uni

    Then Expect Auto Suggest name shows James Jones for entry 3
    And Expect Auto Suggest location shows San Diego, CA, United States for entry 3

    Then Select entry 3 in the auto suggest drop down list
    Then Order Details - Set Form Pounds to 0
    And Expect Domestic Address field displays James Jones, 600 Front St Apt 220, San Diego, CA 92101-6733

    Then Sign out



