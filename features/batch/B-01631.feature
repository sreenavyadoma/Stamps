Feature:  B-01631 As a batch shipper, I want to be able to see the total cost of my print job before I print

  Scenario 1: Show the total cost of the User's print job - single print

    Given User selects an Order from Orders grid in Web Batch
    And clicks the "Print" button
    When the Print dialog is displayed
    Then the <Total Cost> of the print job should show in the bottom-right corner of the dialog
    And the <Total Cost> should include <Postage Cost>
    And <Tracking Cost> if it is included
    And <Stamps.com Insurance Cost> if it is included in the User's print

  Examples

  | Service                                  | Postage Cost | Stamps.com Insurance Cost | Tracking Cost | Total Cost |
  | First-Class Large Envelope/Flat          | $0.98        | $2.20                     | $0.00         | $3.18      |
  | Priority Mail Large/Thick Envelope       | $6.51        | $2.75                     | $2.45         | $11.71     |
  | Priority Mail Express Flat Rate Envelope | $18.11       | $4.60                     | $0.00         | $22.71     |
  | Parcel Select Oversized Package          | $159.87      | $7.00                     | $2.45         | $169.32    |
  ___________________________________________________________________________________

  Scenario 2: Show the total cost of the User's print job - multi-print

    Given User selects multiple <Orders> from Orders grid in Web Batch
    And clicks the "Print" button
    When the Print dialog is displayed
    Then the <Total Cost> of the print job should show in the bottom-right corner of the dialog
    And the <Total Cost> should include <Postage Costs> of all the orders
    And <Tracking Costs> if it is included of all the order
    And <Stamps.com Insurance Cost> if it is included of all the orders in the User's print job

  Examples

  | Order | Service                                  | Postage Cost | Stamps.com Insurance Cost | Tracking Cost |
  | 1     | First-Class Large Envelope/Flat          | $0.98        | $2.20                     | $0.00         |
  | 2     | Priority Mail Large/Thick Envelope       | $6.51        | $2.75                     | $2.45         |
  | 3     | Priority Mail Express Flat Rate Envelope | $18.11       | $4.60                     | $0.00         |
  | 4     | Parcel Select Oversized Package          | $159.87      | $7.00                     | $2.45         |

  | Postage Costs | Stamps.com Insurance Costs | Tracking Costs | Total Cost |
  | $185.47       | 16.55                      | $4.90          | $206.92    |


  ___________________________________________________________________________________

