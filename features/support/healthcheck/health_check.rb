module Stamps
  class SdcHealthCheck < SdcPage
    page_url { |env, app| "https://print#{env}.stamps.com/#{app.to_s}/healthcheck.aspx" }
  end
end