

class SdcHealthCheck < SdcPage
  page_url { |env, app| "https://#{env}.stamps.com/#{app.to_s}/healthcheck.aspx" }
end