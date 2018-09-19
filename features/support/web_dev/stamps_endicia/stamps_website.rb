module StampsWebsite
  class HomePage < SdcPage

    ##left content
    page_object(:hp_left_content_hdr) { {xpath: '//h1[(contains(text(), "POSTAGE"))]'} }
    page_object(:hp_left_content_txt) { {xpath: '//h2[(contains(text(), "Print your own postage and shipping labels in seconds."))]'} }
    page_objects(:hp_click, index: 0) {{xpath: '//div[@id="click-print-mail"]/div'}}
    page_object(:hp_click_hdr) { {xpath: '//h3[(contains(text(), "CLICK"))]'} }
    page_objects(:hp_click_txt, index: 0) { {xpath: '//div[@id="click-print-mail"]/div/p'} }
    page_objects(:hp_print, index: 1) {{xpath: '//div[@id="click-print-mail"]/div'}}
    page_object(:hp_print_hdr) { {xpath: '//h3[(contains(text(), "PRINT"))]'} }
    page_objects(:hp_print_txt, index: 1) { {xpath: '//div[@id="click-print-mail"]/div/p'} }
    page_objects(:hp_mail, index: 2) {{xpath: '//div[@id="click-print-mail"]/div'}}
    page_object(:hp_mail_hdr) { {xpath: '//h3[(contains(text(), "MAIL"))]'} }
    page_objects(:hp_mail_txt, index: 2) { {xpath: '//div[@id="click-print-mail"]/div/p'} }
    ##right-content
    page_object(:offer_box) {{id: 'offer-box'}}
    page_objects(:offer_details_link, index: 0) { {xpath: '//div[@id="fivedollar"]/a'} }

    def self.visit
      dev_env = data_for(:web_dev_env, {})['dev']
      if dev_env.include?(TestSession.env.url.to_s)
        page_url { |env| "https://#{env}-win10.corp.stamps.com/stampscom/?mboxDisable=1" }
      elsif TestSession.env.url == :prod
        page_url { |env| "https://www.#{env}stamps.com/?mboxDisable=1" }
      else
        page_url { |env| "https://#{env}stamps.com/?mboxDisable=1" }
      end
      super(case TestSession.env.url
              when :qacc
                'sdcwebsite.qacc.'
              when :stg
                'sdcwebsite.staging.'
              when :prod
                ''
              when :iigwe
                'iigwe'
              when :jjones
                'jjones'
              when :cjanczak
                'cjanczak'
              when :cesar
                'cesar'
              when :wlanni
                'wlanni'
              else
                # ignore
            end)
    end
  end

  class PostageOnlinePage < SdcPage
    def self.visit
      dev_env = data_for(:web_dev_env, {})['dev']
      if dev_env.include?(TestSession.env.url.to_s)
        page_url { |env| "https://#{env}-win10.corp.stamps.com/stampscom/postage-online/?mboxDisable=1" }
      elsif TestSession.env.url == :prod
        page_url { |env| "https://www.#{env}stamps.com/postage-online/?mboxDisable=1" }
      else
        page_url { |env| "https://#{env}stamps.com/postage-online/?mboxDisable=1" }
      end

      super(case TestSession.env.url
              when :qacc
                'sdcwebsite.qacc.'
              when :stg
                'sdcwebsite.staging.'
              when :prod
                ''
              when :iigwe
                'iigwe'
              when :jjones
                'jjones'
              when :cjanczak
                'cjanczak'
              when :cesar
                'cesar'
              when :wlanni
                'wlanni'
              else
                # ignore
            end)
    end

  end


  class << self

    def home_page
      HomePage.new
    end

    def postage_online_page
      PostageOnlinePage.new
    end

    def common_page
      Common.new
    end

    def sdc_db_connection
      SdcWebsiteDB.new
    end

    def bridge_db_connection
      VBridgeDB.new
    end

    def stamp_mart_db_connection
      StampMartDB.new
    end

  end

end