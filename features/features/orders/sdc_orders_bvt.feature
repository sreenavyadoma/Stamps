Feature:  BVT tests for Orders

  Background:
    Given Start test driver

  @healthcheck
  Scenario: Orders Healthcheck
    Then Verify Health Check for Orders

  @healthcheck
  Scenario: Address Book Healthcheck
    Then Verify Health Check for Address Book

  @healthcheck
  Scenario: OR Reports Healthcheck
    Then Verify Health Check for OR Reports

  @healthcheck
  Scenario: Postage Tools Healthcheck
    Then Verify Health Check for Postage Tools


  @authentication
  Scenario: Orders Authentication Test
    Then sign-in to Orders
    Then sign-out of SDC Website

  @bvt_new_order
  Scenario:  BVT Add a new order
    Then sign-in to Orders
    Then add new order
    Then set order details ship-to to random address between zone 9
    Then set order details service to PM Package
    Then set order details pounds to 1
    Then set order details ounces to 1
    Then set order details insure-for to $1.00
    Then set order details length to 1
    Then set order details width to 1
    Then set order details height to 1
#  # Orders Grid Operations
    Then uncheck Orders Grid row 1
    Then expect orders grid pounds is 1
    Then expect orders grid ounces is 1
    Then expect orders grid weight is 1 lb. 1 oz.
    Then expect orders grid insured value is $1.00
    Then sign-out of SDC Website


  @bvt_orders_ship_date
  Scenario: Ship Date defaults to today
    Then sign-in to Orders
    Then open orders settings general settings
    Then set orders settings general postdate to now +2 hours
    Then close orders settings modal
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set order details ounces to 4
    Then set order details service to PM Flat Rate Envelope
    Then click orders toolbar print button
    Then expect print modal ship date is 0 days from today
    Then close print modal

    Then open orders settings general settings
    Then set orders settings general postdate to now -2 hours
    Then close orders settings modal
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set order details ounces to 4
    Then set order details service to PM Flat Rate Envelope
    Then click orders toolbar print button
    Then expect print modal ship date is 1 days from today
    Then close print modal

    Then open orders settings general settings
    Then set orders settings general postdate to now +2 hours
    Then close orders settings modal
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set order details ounces to 4
    Then set order details service to PM Flat Rate Envelope
    Then click orders toolbar print button
    Then expect print modal ship date is 0 days from today
    Then set print modal ship date to today
    Then set print modal ship date to today plus 1
    Then set print modal ship date to today plus 2
    Then set print modal ship date to today
    Then expect print modal ship date is 0 days from today
    Then close print modal
    Then open orders settings general settings
    Then set orders settings general postdate to 5:00 p.m.
    Then close orders settings modal
    Then sign out

  @bvt_orders_ship_date_calendar
  Scenario: Set Ship Date to today
    Then sign-in to Orders
    Then open orders settings general settings
    Then set orders settings general postdate to now +2 hours
    Then close orders settings modal
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to PM FR Envelope, 8.5x11, 5912 83rd St., Lubbock TX 79424-3608
    Then set order details ounces to 4
    Then set order details service to PM Flat Rate Envelope
    Then click orders toolbar print button
    Then expect print modal ship date is 0 days from today
    Then select Print modal Ship Date datepicker to today
    Then select Print modal Ship Date datepicker to today plus 1
    Then select Print modal Ship Date datepicker to today plus 2
    Then select Print modal Ship Date datepicker to today
    Then expect print modal ship date is 0 days from today
    Then close print modal
    Then open orders settings general settings
    Then set orders settings general postdate to 5:00 p.m.
    Then close orders settings modal
    Then sign out

  @bvt_international_shipping
  Scenario: BVT International Shipping
    Then sign-in to Orders
    Then add new order
    Then set order details ship-to international address to
      | full_name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random      | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then set order details ounces to 4
    Then set order details service to PMI Flat Rate Envelope
    Then click order details form customs form button
    # create items
    Then add customs associated item 1, description random, qty 1, Price 4, Made In Zimbabwe, Tariff 1
    Then add customs associated item 2, description random, qty 1, Price 4, Made In Japan, Tariff 1
    Then add customs associated item 3, description random, qty 1, Price 4, Made In France, Tariff 1
    Then add customs associated item 4, description random, qty 1, Price 4, Made In Philippines, Tariff 1
    Then add customs associated item 5, description random, qty 1, Price 4, Made In Czech Republic, Tariff 1
    Then add customs associated item 6, description random, qty 1, Price 4, Made In Denmark, Tariff 1
    Then add customs associated item 7, description random, qty 1, Price 4, Made In Scotland (Great Britain), Tariff 1
    Then add customs associated item 8, description random, qty 1, Price 4, Made In Spain, Tariff 1
    Then add customs associated item 9, description random, qty 1, Price 4, Made In United Kingdom (Great Britain), Tariff 1
    Then add customs associated item 10, description random, qty 1, Price 4, Made In Australia, Tariff 1
    Then add customs associated item 11, description random, qty 1, Price 4, Made In Norway, Tariff 1
    # edit item
    Then edit customs associated item 1, description random, qty 2, Price 4, Made In United States, Tariff 1
    Then edit customs associated item 2, description random, qty 2, Price 4, Made In United States, Tariff 1

    Then expect customs associated item grid count is 11
    Then set customs package contents to Commercial Sample
    Then set customs package contents to Gift
    Then set customs package contents to Document
    Then set customs package contents to Humanitarian Donation
    Then set customs package contents to Merchandise
    Then set customs package contents to Other
    Then set Customs More Info to random
    Then set customs non-delivery options to Return to sender
    Then set customs internal transaction number to Not required
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then click orders toolbar print button
    Then in print modal, click close button
    Then sign out

  @bvt_shipping_address_management
  Scenario: BVT Shipping Address
    Then sign-in to Orders
    Then add new order
    Then on Manage Shipping Address modal, add address
      |ship_from_zip  | full_name  | company    | street_address| street_address2 | city          | state       | zip    | country       | phone           |
      |90245          | Euan  | Betfair UK | 101 Mission Street | Suite 700       | San Francisco | California  | 94105  | United States | (415) 123-5555  |
    Then on Manage Shipping Address modal, delete all addresses
    Then set order details ship-from to San Francisco, CA
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details service to PM Package
    Then sign out

  @bvt_shipstation_search
  Scenario: Search shipstation orders
    Then sign-in to Orders
    Then add new order
    Then set order details ship-to to random address in zone 1
    Then set order details email to random
    Then set order details phone to random
    Then set order details service to PM Package
    Then set order details weight to 1 lb 1 oz
    Then uncheck orders grid order id cached
    Then check orders grid order id cached
    Then search filtered Orders for cached Order ID
    Then expect Filter Panel search results tab is present
    Then expect Filter Panel search result count is 1
    Then check orders grid order id cached
    Then expect Order Details Order ID equals Grid Order ID in row 1
    Then expect Order Details Order ID is the same as saved Order ID
    Then expect Filter Panel search result count is greater than 0
    Then remove Filter Panel search results tab
    Then expect Filter Panel search results tab is not present
    Then sign out

  @bvt_shipstation_updates_domestic
  Scenario: Update ShipStation for Domestic
    Then sign-in to Orders
    Then add new order
    Then set order details ship-to domestic address to
      | full_name       | company      | street_address   | street_address_2| city    | state | zip    | country  |
      | First Last      | Company Name | 777 N Orange Ave | Apt 100         | Orlando | FL    | 32801  | United States |
    Then set order details phone to 888-888-8888
    Then set order details email to rtest@stamps.com
    Then set order details pounds to 1
    Then set order details ounces to 1
    Then set order details service to PM Package
    Then set order details insure-for to $100.00
    # Then set Order Details Tracking to Signature Required
    Then set order details length to 1
    Then set order details width to 1
    Then set order details height to 1
    Then expect orders grid service is Priority Mail
    Then expect orders grid service is PM Package
    Then expect orders grid service is correct

    Then set order details reference number to Update Orders To ShipStation
    Then on order details form, add item 1, qty 1, id Item 1 SKU, description Item 1 Description

    Then pause for 2 seconds
    Then blur out on order details form
    Then pause for 2 seconds

    Then uncheck orders grid order id cached

    Then pause for 2 seconds
    Then check orders grid order id cached
    Then pause for 2 seconds
    Then blur out on order details form

  #Verify Single Order Details form was saved in ShipStation
    Then expect order details ship-from and ship-from saved values are the same
    Then expect order details ship-to name is First Last
    Then expect order details ship-to company name is Company Name
    Then expect order details ship-to cleansed street address is 777 N Orange Ave Apt 100
    Then expect order details ship-to cleansed city is Orlando
    Then expect order details ship-to cleansed state is FL
    Then expect order details ship-to cleansed zip plus 4 code is 32801-1175
    Then expect order details ship-to cleansed zip code is 32801
    Then expect order details ship-to phone is 888-888-8888
    Then expect order details ship-to email is rtest@stamps.com
    Then expect order details pound is 1
    Then expect order details ounce is 1
    Then expect order details length is 1
    Then expect order details width is 1
    Then expect order details height is 1
    Then expect order details service cost is correct
    Then expect order details insure-for is 100.00
    Then expect order details tracking is correct
    Then expect order details tracking cost is correct
    Then expect order details reference number is correct

    Then expect orders grid store is Manual Orders
    Then expect orders grid order id is the same as details form order id
    Then expect orders grid ship cost is the same as details form ship cost
    Then expect orders grid age is < 24 hours
    Then expect orders grid order date is populated
    Then expect orders grid recipient is correct
    Then expect orders grid company is Company Name
    Then expect orders grid address is 777 N Orange Ave Apt 100
    Then expect orders grid city is Orlando
    Then expect orders grid state is FL
    Then expect orders grid zip is 32801-1175
    Then expect orders grid phone is 888-888-8888
    Then expect orders grid email is rtest@stamps.com
    Then expect orders grid qty. is 1
    Then expect orders grid item sku is Item 1 SKU
    Then expect orders grid item name is Item 1 Description
    Then expect orders grid service is Priority Mail
    Then expect orders grid weight is 1 lb. 1 oz.
    Then expect orders grid order status is Awaiting Shipment
    Then expect orders grid pounds is 1
    Then expect orders grid ounces is 1
    Then expect orders grid insured value is $100.00

    Then click orders toolbar print button
    Then in print modal, click close button
    Then sign out

  @bvt_shipstation_updates_international
  Scenario:  Update ShipStation for International
    Then sign-in to Orders
    Then add new order
    Then set order details ship-to international address to
      | full_name     | company       | street_address_1 | street_address_2 | city          | province      | postal_code   | country| phone         |  email        |
      | Random string | Random string | Random string    | Random string    | Random string | Random string | Random string | India  | Random phone  | Random email  |
    Then expect order details ship-to country is correct
    Then set order details weight to 2 lb 2 oz
    Then set order details service to PMI Package/Flat/Thick Envelope
    Then set order details insure-for to $100.25
    Then set order details reference number to Some random string
    Then on order details form, add item 1, qty 1, id ID 1, description Description 1
    Then on order details form, add item 2, qty 2, id random string, description random string
    Then on order details form, add item 3, qty 3, id ID 3, description random string
    Then expect orders grid service is Priority Mail International
    Then expect orders grid service is PMI Package/Flat/Thick Envelope
    Then expect orders grid service is correct

    Then click order details form customs form button
    Then expect customs i agree to the usps privacy act statement is unchecked
    Then set customs package contents to Document
    Then set customs package contents to Commercial Sample
    Then expect customs package contents is Commercial Sample
    Then set customs license number to a random string
    Then expect customs license number is correct
    Then set customs certificate number to some random string
    Then expect customs certificate number is correct
    Then set customs invoice number to a random string
    Then expect customs invoice number is correct
    Then set customs non-delivery options to Treat as abandoned
    Then expect customs non-delivery options is Treat as abandoned
    Then set customs internal transaction number to Required
    Then expect customs internal transaction number is Required
    Then set customs itn number to ITN123
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then add customs associated item 2, description Item 2, qty 2, Price 2, Made In Japan, Tariff 2
    Then add customs associated item 3, description Random String, qty 3, Price 3, Made In Canada, Tariff 3
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form

    Then pause for 1 second
    Then blur out on order details form
    Then uncheck orders grid order id cached
    Then pause for 3 seconds
    Then check orders grid order id cached
    Then pause for 2 seconds

    Then expect order details international ship-to name is correct
    Then expect order details international ship-to company is correct
    Then expect order details international ship-to address 1 is correct
    Then expect order details international ship-to address 2 is correct
    Then expect order details international ship-to city is correct
    Then expect order details international ship-to province is correct
    Then expect order details international ship-to postal code is correct
    Then expect order details international ship-to phone is correct
    Then expect order details international ship-to email is correct
    Then expect order details reference number is correct
    Then expect order details service cost is correct
    Then expect order details pounds is 2
    Then expect order details ounces is 2
    Then expect order details associated item 1 qty is 1
    Then expect order details associated item 1 ID is ID 1
    Then expect order details associated item 1 Description is Description 1
    Then expect order details associated item 2 qty is 2
    Then expect order details associated item 2 ID is correct
    Then expect order details associated item 2 Description is correct
    Then expect order details associated item 3 qty is 3
    Then expect order details associated item 3 ID is ID 3
    Then expect order details associated item 3 Description is correct
    Then expect order details insure-for is correct
    Then click order details form customs form button
    Then pause for 2 second
    Then expect customs package contents is Commercial Sample
    Then expect customs license number is correct
    Then expect customs certificate number is correct
    Then expect customs invoice number is correct

     #Then expect customs non-delivery options is Treat as abandoned
     #Then expect customs internal transaction number is Required
     #Then expect Customs ITN Number is correct

    Then expect customs associated item 1 Description is correct
    Then expect customs associated item 1 Quantity is correct
    Then expect customs associated item 1 Unit Price is correct
    Then expect customs associated item 1 Made In is correct
    Then expect customs associated item 1 Tariff is correct
    Then expect customs associated item 2 Description is correct
    Then expect customs associated item 2 Quantity is correct
    Then expect customs associated item 2 Unit Price is correct
    Then expect customs associated item 2 Made In is correct
    Then expect customs associated item 3 Description is correct
    Then expect customs associated item 3 Quantity is correct
    Then expect customs associated item 3 Unit Price is correct
    Then expect customs associated item 3 Made In is correct
    Then expect customs associated item 3 Tariff is correct

    Then expect customs i agree to the usps privacy act statement is checked
    Then expect Customs Total Value is correct
    Then close customs information form

    Then expect orders grid recipient is correct
    Then expect orders grid company is correct
    Then expect Orders Grid Country is correct
    Then expect orders grid address is correct
    Then expect orders grid city is correct
    Then expect orders grid state is correct
    Then expect orders grid zip is correct
     #Then expect orders grid phone is correct
     #Then expect orders grid email is correct

    Then expect orders grid qty. is 6
    Then expect orders grid item sku is Multiple
    Then expect orders grid item name is Multiple

    Then expect orders grid service is Priority Mail International
    Then expect orders grid pounds is correct
    Then expect orders grid ounces is correct
    Then expect order details insure-for is correct
    Then expect orders grid order status is Awaiting Shipment

    Then pause for 2 second
    Then sign out