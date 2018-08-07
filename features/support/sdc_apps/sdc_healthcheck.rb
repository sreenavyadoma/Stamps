
class SdcHealthCheck < SdcPage
  page_url { |env, app| "https://#{env}.stamps.com/#{app.to_s}/healthcheck.aspx" }
  page_object(:body) { { xpath: '//body/pre' } }
end