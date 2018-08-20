module StampsWebsite

end

class SDCWWebsite <SdcPage
  def self.visit(str)
    page_url { |env| "https://#{env}stamps.com/?source=#{str}&mboxDisable=1" }
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