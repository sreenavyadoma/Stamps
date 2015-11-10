Feature: Sorting.

  Background:
    Given I am signed in as a batch shipper gc/shipstation/autosuggest/326tsetaqcdS!

  @sort @regression
  Scenario: Sorting


    Then Sort Order Grid Order ID in ascending order
    Then Sort Order Grid Order ID in descending order


    Then Sort Order Grid Recipient in descending order


    Then Sort Order Grid Address in descending order


    Then Sort Order Grid City in descending order

    Then Sort Order Grid State in ascending order
    Then Sort Order Grid State in descending order

    Then Sort Order Grid Zip in ascending order
    Then Sort Order Grid Zip in descending order

    Then Sort Order Grid Phone in ascending order
    Then Sort Order Grid Phone in descending order

    Then Sort Order Grid Email in ascending order
    Then Sort Order Grid Email in descending order

    Then Sort Order Grid Qty in ascending order
    Then Sort Order Grid Qty in descending order

    Then Sort Order Grid Item SKU in ascending order
    Then Sort Order Grid Item SKU in descending order

    Then Sort Order Grid Item Name in ascending order
    Then Sort Order Grid Item Name in descending order

    Then Sort Order Grid Weight in ascending order
    Then Sort Order Grid Weight in descending order

    Then Sort Order Grid Insured Value in ascending order
    Then Sort Order Grid Insured Value in descending order

    Then Sort Order Grid Order Status in ascending order
    Then Sort Order Grid Order Status in descending order

    Then Sort Order Grid Order Total in ascending order
    Then Sort Order Grid Order Total in descending order

    Then Sort Order Grid Country in ascending order
    Then Sort Order Grid Country in descending order



