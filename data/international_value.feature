
Feature:  B-01813 - Allow Int'l and APO/FPO Printing (CN22 and CP72)

  Background:
    * I am signed in as a batch shipper

  Scenario: Total Value:  If Total Value > $400 AND Int'l Service is Any First-Class Mail International service or Priority Mail International Flat Rate Envelope, Padded Flat Rate Envelope, Legal Flat Rate Envelope, and Small Flat Rate Box: Show Warning icon with the following hover over content:
  Total value cannot exceed $400 for this USPS service.  Consider using a different service that does not have limits on the value of the contents.
    * Add new order
