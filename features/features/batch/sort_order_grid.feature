Feature:  B-01774 - Sort Order Grid

  Background:
    Given I am signed in as a batch shipper ff/autosuggest/password1

  @sorting1
  Scenario: As a batch shipper, I want the first page of orders to appear when I sort a column


  @sorting2
  Scenario: As a batch shipper, I want to be able to sort the orders grid by clicking on each column header

    * Click Age column header to sort in ascending order
    * Expect Age column sorted in ascending order
    * Click Age column header to sort in descending order
    * Expect Age column sorted in descending order

    * Click Order ID column header to sort in ascending order
    * Expect Order ID column sorted in ascending order
    * Click Order ID column header to sort in descending order
    * Expect Order ID column sorted in descending order

    * Click Order Date column header to sort in ascending order
    * Expect Order Date column sorted in ascending order
    * Click Order Date column header to sort in descending order
    * Expect Order Date column sorted in descending order

    * Click Recipient column header to sort in ascending order
    * Expect Recipient column sorted in ascending order
    * Click Recipient column header to sort in descending order
    * Expect Recipient column sorted in descending order

    * Click Address column header to sort in ascending order
    * Expect Address column sorted in ascending order
    * Click Address column header to sort in descending order
    * Expect Address column sorted in descending order

    * Click City column header to sort in ascending order
    * Expect City column sorted in ascending order
    * Click City column header to sort in descending order
    * Expect City column sorted in descending order

    * Click State column header to sort in ascending order
    * Expect State column sorted in ascending order
    * Click State column header to sort in descending order
    * Expect State column sorted in descending order

    * Click Zip column header to sort in ascending order
    * Expect Zip column sorted in ascending order
    * Click Zip column header to sort in descending order
    * Expect Zip column sorted in descending order

    * Click Phone column header to sort in ascending order
    * Expect Phone column sorted in ascending order
    * Click Phone column header to sort in descending order
    * Expect Phone column sorted in descending order

    * Click Email column header to sort in ascending order
    * Expect Email column sorted in ascending order
    * Click Email column header to sort in descending order
    * Expect Email column sorted in descending order

    * Click Qty column header to sort in ascending order
    * Expect Qty column sorted in ascending order
    * Click Qty column header to sort in descending order
    * Expect Qty column sorted in descending order

    * Click Item SKU column header to sort in ascending order
    * Expect Item SKU column sorted in ascending order
    * Click Item SKU column header to sort in descending order
    * Expect Item SKU column sorted in descending order

    * Click Item Name column header to sort in ascending order
    * Expect Item Name column sorted in ascending order
    * Click Item Name column header to sort in descending order
    * Expect Item Name column sorted in descending order

    * Click Ship From column header to sort in ascending order
    * Expect Ship From column sorted in ascending order
    * Click Ship From column header to sort in descending order
    * Expect Ship From column sorted in descending order

    * Click Weight column header to sort in ascending order
    * Expect Weight column sorted in ascending order
    * Click Weight column header to sort in descending order
    * Expect Weight column sorted in descending order

    * Click Insured Value column header to sort in ascending order
    * Expect Insured Value column sorted in ascending order
    * Click Insured Value column header to sort in descending order
    * Expect Insured Value column sorted in descending order

    * Click Order Status column header to sort in ascending order
    * Expect Order Status column sorted in ascending order
    * Click Order Status column header to sort in descending order
    * Expect Order Status column sorted in descending order

    * Click Ship Date column header to sort in ascending order
    * Expect Ship Date column sorted in ascending order
    * Click Ship Date column header to sort in descending order
    * Expect Ship Date column sorted in descending order

    * Click Order Total column header to sort in ascending order
    * Expect Order Total column sorted in ascending order
    * Click Order Total column header to sort in descending order
    * Expect Order Total column sorted in descending order

    * Click Country column header to sort in ascending order
    * Expect Country column sorted in ascending order
    * Click Country column header to sort in descending order
    * Expect Country column sorted in descending order


  @sorting3
  Scenario: As a batch shipper, I want to be able to sort the orders grid by clicking on the arrows in each column header

    When Click ascending arrow on Phone column header
