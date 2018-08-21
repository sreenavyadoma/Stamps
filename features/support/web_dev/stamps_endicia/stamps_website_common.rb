module StampsWebsite
  class Common < SdcPage
    #stamps website
    page_object(:stamps_logo) {{id: 'sdc-logo'}}
    button(:get_started) { { class: ['btn btn-success btn-xs register'] } }
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