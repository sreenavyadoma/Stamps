Feature:  B-01774 - Sort Order Grid

  Background:
    * I am signed in as a batch shipper

  @sorting
  Scenario: As a batch shipper, I want the first page of orders to appear when I sort a column


  Scenario: As a batch shipper, I want to be able to sort the orders grid by clicking on each column header

    * Click Ship Cost column header to sort in ascending order
    * Expect Ship Cost column sorted in ascending order
    * Click Ship Cost column header to sort in descending order
    * Expect Ship Cost column sorted in descending order

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

    * Click Service column header to sort in ascending order
    * Expect Service column sorted in ascending order
    * Click Service column header to sort in descending order
    * Expect Service column sorted in descending order

    * Click Weight column header to sort in ascending order
    * Expect Weight column sorted in ascending order
    * Click Weight column header to sort in descending order
    * Expect Weight column sorted in descending order

    * Click Insured Value column header to sort in ascending order
    * Expect Insured Value column sorted in ascending order
    * Click Insured Value column header to sort in descending order
    * Expect Insured Value column sorted in descending order

    * Click Reference No. column header to sort in ascending order
    * Expect Reference No. column sorted in ascending order
    * Click Reference No. column header to sort in descending order
    * Expect Reference No. column sorted in descending order

    * Click Cost Code column header to sort in ascending order
    * Expect Cost Code column sorted in ascending order
    * Click Cost Code column header to sort in descending order
    * Expect Cost Code column sorted in descending order

    * Click Order Status column header to sort in ascending order
    * Expect Order Status column sorted in ascending order
    * Click Order Status column header to sort in descending order
    * Expect Order Status column sorted in descending order

    * Click Ship Date column header to sort in ascending order
    * Expect Ship Date column sorted in ascending order
    * Click Ship Date column header to sort in descending order
    * Expect Ship Date column sorted in descending order

    * Click Tracking # column header to sort in ascending order
    * Expect Tracking # column sorted in ascending order
    * Click Tracking # column header to sort in descending order
    * Expect Tracking # column sorted in descending order

    * Click Order Total column header to sort in ascending order
    * Expect Order Total column sorted in ascending order
    * Click Order Total column header to sort in descending order
    * Expect Order Total column sorted in descending order

    * Click Country column header to sort in ascending order
    * Expect Country column sorted in ascending order
    * Click Country column header to sort in descending order
    * Expect Country column sorted in descending order


  Scenario: As a batch shipper, I want to be able to sort the orders grid by clicking on each column header

    * Sort by select - Ship Cost ascending
    * Expect Ship Cost sorted - ascending
    * Sort by select - Ship Cost descending
    * Expect Ship Cost sorted - descending

    * Sort by select - Age ascending
    * Expect Age sorted - ascending
    * Sort by select - Age descending
    * Expect Age sorted - ascending

    * Sort by select - Order ID ascending
    * Expect Order ID sorted - ascending
    * Sort by select - Order ID descending
    * Expect Order ID sorted - descending

    * Sort by select - Order Date ascending
    * Expect Order Date sorted - ascending
    * Sort by select - Order Date descending
    * Expect Order Date sorted - ascending

    * Sort by select - Recipient ascending
    * Expect Recipient sorted - ascending
    * Sort by select - Recipient descending
    * Expect Recipient sorted - descending

    * Sort by select - Address ascending
    * Expect Address sorted - ascending
    * Sort by select - Address descending
    * Expect Address sorted - ascending

    * Sort by select - City ascending
    * Expect City sorted - ascending
    * Sort by select - City descending
    * Expect City sorted - descending

    * Sort by select - State ascending
    * Expect State sorted - ascending
    * Sort by select - State descending
    * Expect State sorted - ascending

    * Sort by select - Zip ascending
    * Expect Zip sorted - ascending
    * Sort by select - Zip descending
    * Expect Zip sorted - descending

    * Sort by select - Phone ascending
    * Expect Phone sorted - ascending
    * Sort by select - Phone descending
    * Expect Phone sorted - ascending

    * Sort by select - Email ascending
    * Expect Email sorted - ascending
    * Sort by select - Email descending
    * Expect Email sorted - descending

    * Sort by select - Qty ascending
    * Expect Qty sorted - ascending
    * Sort by select - Qty descending
    * Expect Qty sorted - ascending

    * Sort by select - Item SKU ascending
    * Expect Item SKU sorted - ascending
    * Sort by select - Item SKU descending
    * Expect Item SKU sorted - descending

    * Sort by select - Item Name ascending
    * Expect Item Name sorted - ascending
    * Sort by select - Item Name descending
    * Expect Item Name sorted - ascending

    * Sort by select - Ship From ascending
    * Expect Ship From sorted - ascending
    * Sort by select - Ship From descending
    * Expect Ship From sorted - descending

    * Sort by select - Service ascending
    * Expect Service sorted - ascending
    * Sort by select - Service descending
    * Expect Service sorted - ascending

    * Sort by select - Weight ascending
    * Expect Weight sorted - ascending
    * Sort by select - Weight descending
    * Expect Weight sorted - descending

    * Sort by select - Insured Value ascending
    * Expect Insured Value sorted - ascending
    * Sort by select - Insured Value descending
    * Expect Insured Value sorted - ascending

    * Sort by select - Reference No. ascending
    * Expect Reference No. sorted - ascending
    * Sort by select - Reference No. descending
    * Expect Reference No. sorted - descending

    * Sort by selecte - Cost Code ascending
    * Expect Cost Code sorted - ascending
    * Sort by select - Cost Code descending
    * Expect Cost Code sorted - ascending

    * Sort by select - Order Status ascending
    * Expect Order Status sorted - ascending
    * Sort by select - Order Status descending
    * Expect Order Status sorted - descending

    * Sort by select - Ship Date ascending
    * Expect Ship Date sorted - ascending
    * Sort by select - Ship Date descending
    * Expect Ship Date sorted - ascending

    * Sort by select - Tracking # ascending
    * Expect Tracking # sorted - ascending
    * Sort by select - Tracking # descending
    * Expect Tracking # sorted - descending

    * Sort by select - Order Total ascending
    * Expect Order Total sorted - ascending
    * Sort by select - Order Total descending
    * Expect Order Total sorted - ascending

    * Sort by select - Country ascending
    * Expect Country sorted - ascending
    * Sort by select - Country descending
    * Expect Country sorted - ascending