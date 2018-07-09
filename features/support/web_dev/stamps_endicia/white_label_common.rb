module WhiteLabel

  class Common < SdcPage
    button(:get_started) { { class: ['btn btn-success btn-xs register']} }
  end

  class SDCWWebsite
    def self.visit
      page_url { |env| "https://#{env}stamps.com/" }
      super(case SdcEnv.env
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

  class EWWebsite

    def self.visit
      page_url { |env| "https://#{env}endicia.com/" }
      super(case SdcEnv.env
              when :qacc
                'registration.qacc.'
              when :stg
                'registration.staging.'
              when :prod
                ''
              else
                # ignore
            end)
    end
  end

end