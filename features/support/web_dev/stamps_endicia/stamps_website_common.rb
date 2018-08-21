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
    #page_object(:usps_logo) {{xpath: '//div[@id="nav-usps-vendor"]'}}
    #page_object(:usps_logo) {{xpath: '//div[@id="nav-usps-vendor"]'}}

    #footer
    page_objects(:usps_logo,  index: 1) {{xpath: '//figure[@id="usps-logo-words"]/img'}}
    page_objects(:usps_logo_caption,  index: 1) {{xpath: '//figure[@id="usps-logo-words"]/figcaption'}}
    page_object(:copyright) { {xpath: '//p[@class="copyright hidden-xs"]/a'} }
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