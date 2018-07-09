module WhileLabel
  class Common < SdcPage

    def self.sdcwr_visit
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

    button(:get_started) { { class: ['btn btn-success btn-xs register']} }
  end
end