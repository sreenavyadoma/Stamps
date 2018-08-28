module StampsWebsite
  class HomePage < SdcPage

  end

  class PostageOnlinePage < SdcPage

    page_url { |env| "https://#{env}stamps.com/postage-online/?mboxDisable=1" }
    def self.visit
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