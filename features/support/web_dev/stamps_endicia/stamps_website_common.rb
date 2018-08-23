module StampsWebsite
  class Common < SdcPage
    #stamps website
    page_object(:stamps_logo) {{id: 'sdc-logo'}}
    button(:get_started) { { class: ['btn btn-success btn-xs register'] } }
    button(:log_in) { { class: ['btn btn-info btn-xs login'] } }
    page_object(:learn_more) { {class: ['dropdown-toggle']} }
    page_objects(:small_office_mailers, index: 0) { {xpath: '//a[contains(text(),"Small Office Mailers")]' } }
    page_objects(:online_sellers, index: 0) { {xpath: '//a[contains(text(),"Online Sellers")]' } }
    page_objects(:warehouse_shippers, index: 0) { {xpath: '//a[contains(text(),"Warehouse Shippers")]' } }
    page_objects(:corporate_postage_solutions, index: 0) { {xpath: '//a[contains(text(),"Corporate Postage Solutions")]' } }
    page_object(:faq) { {xpath: '//a[contains(text(),"FAQ")]'} }

    #mobile
    button(:get_started_xs) {{class: ['btn btn-success btn-xs register visible-xs-block']}}
    button(:menu_xs) {{id: 'menu-top'}}
    link(:menu_get_started_xs) {{class: ['list-group-item list-group-item-success register']}}
    link(:menu_learn_more_xs) {{xpath: '//a[@href="#learn-more-menu"]'}}
    page_objects(:small_office_mailers_xs, index: 1) { {xpath: '//a[contains(text(),"Small Office Mailers")]' } }
    page_objects(:online_sellers_xs, index: 1) { {xpath: '//a[contains(text(),"Online Sellers")]' } }
    page_objects(:warehouse_shippers_xs, index: 1) { {xpath: '//a[contains(text(),"Warehouse Shippers")]' } }
    page_objects(:corporate_postage_solutions_xs, index: 1) { {xpath: '//a[contains(text(),"Corporate Postage Solutions")]' } }

    def dropdown(str, name = :element)
      page_object(name) { {xpath: "//span[contains(text(), \" #{str} \")]" } }
    end

    #footer
    page_objects(:usps_logo,  index: 1) {{xpath: '//figure[@id="usps-logo-words"]/img'}}
    page_objects(:usps_logo_caption,  index: 1) {{xpath: '//figure[@id="usps-logo-words"]/figcaption'}}
    page_object(:copyright) { {xpath: '//p[@class="copyright hidden-xs"]/a'} }
    ## products ##
    page_object(:footer_office_mailers) {{xpath: '//ul[@id="products-list"]/li/a[contains(@href , "postage-online")]'}}
    page_object(:footer_online_sellers) {{xpath: '//ul[@id="products-list"]/li/a[contains(@href , "shipping")]'}}
    page_object(:footer_warehouse_shippers) {{xpath: '//ul[@id="products-list"]/li/a[contains(@href , "warehouse")]'}}
    page_object(:footer_corporate_postage_solutions) {{xpath: '//ul[@id="products-list"]/li/a[contains(@href , "enterprise")]'}}
    page_object(:footer_photo_stamps) {{xpath: '//ul[@id="products-list"]/li/a[contains(@href , "photo")]'}}
    page_object(:footer_supplies) {{xpath: '//ul[@id="products-list"]/li/a[contains(@href , "store")]'}}
    ## supports ##
    page_object(:download_software) {{xpath: '//ul/li/a[contains(@href , "download")]'}}
    page_object(:customer_support) {{xpath: '//ul/li/a[contains(@href , "custhelp")]'}}
    page_objects(:how_to_videos,  index: 0) {{xpath: '//ul/li/a[contains(@href , "StampscomVideo")]'}}
    page_object(:faq) {{xpath: '//ul/li/a[contains(@href , "faqs")]'}}
    page_object(:system_status) {{xpath: '//ul/li/a[contains(@href , "status")]'}}
    ## company stuff ##
    page_objects(:about_us,  index: 0) {{xpath: '//ul/li/a[contains(@href , "company-info")]'}}
    page_object(:shipping_partners) {{xpath: '//ul/li/a[contains(@href , "integration")]'}}
    page_object(:privacy_policy) {{xpath: '//ul/li/a[contains(@href , "privacy-policy")]'}}
    page_object(:investor_info) {{xpath: '//ul/li/a[contains(@href , "investor")]'}}
    page_object(:careers) {{xpath: '//ul/li/a[contains(@href , "careers")]'}}
    page_object(:Affiliates) {{xpath: '//ul/li/a[contains(@href , "affiliates")]'}}
    page_object(:site_map) {{xpath: '//ul/li/a[contains(@href , "sitemap")]'}}
    page_object(:contact_us) {{xpath: '//ul/li/a[contains(@href , "contact-us")]'}}
    ## developers ##
    page_objects(:footer_supplies,  index: 5) {{xpath: '//div[@id="footer-default-content"]/div[@class="col-sm-2"]/ul/li'}}
    page_objects(:footer_supplies,  index: 5) {{xpath: '//div[@id="footer-default-content"]/div[@class="col-sm-2"]/ul/li'}}
    page_objects(:footer_supplies,  index: 5) {{xpath: '//div[@id="footer-default-content"]/div[@class="col-sm-2"]/ul/li'}}
    page_objects(:footer_supplies,  index: 5) {{xpath: '//div[@id="footer-default-content"]/div[@class="col-sm-2"]/ul/li'}}
    ## follow us ##
    page_objects(:footer_supplies,  index: 5) {{xpath: '//div[@id="footer-default-content"]/div[@class="col-sm-2"]/ul/li'}}
    page_objects(:footer_supplies,  index: 5) {{xpath: '//div[@id="footer-default-content"]/div[@class="col-sm-2"]/ul/li'}}
    page_objects(:footer_supplies,  index: 5) {{xpath: '//div[@id="footer-default-content"]/div[@class="col-sm-2"]/ul/li'}}
    page_objects(:footer_supplies,  index: 1) {{xpath: '//ul[@id="products-list"]/li/a[contains(@href , "StampscomVideo)]'}}
    page_objects(:footer_supplies,  index: 5) {{xpath: '//div[@id="footer-default-content"]/div[@class="col-sm-2"]/ul/li'}}
    page_objects(:footer_supplies,  index: 5) {{xpath: '//div[@id="footer-default-content"]/div[@class="col-sm-2"]/ul/li'}}

  end

  class SDCWWebsite <SdcPage
    def self.visit
      page_url { |env| "https://#{env}stamps.com/?mboxDisable=1" }
      super(case TestSession.env.url
              when :qacc
                'sdcwebsite.qacc.'
              when :stg
                'sdcwebsite.staging.'
              when :prod
                ''
              else
                # ignore
            end)
    end
  end

end