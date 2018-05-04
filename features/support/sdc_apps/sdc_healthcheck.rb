
class SdcHealthCheck < SdcPage
  page_url { |env, app| "https://#{env}.stamps.com/#{app.to_s}/healthcheck.aspx" }

  def self.env(str)
    case(str.downcase)
    when /orders/
      case SdcEnv.env
      when :qacc
        'printext.qacc'
      when :qasc
        'printext.qasc'
      when :stg
        'print.testing'
      when :prod
        ''
      else
        # ignore
      end
    when /address/
      case SdcEnv.env
      when :qacc
        'printext.qacc'
      when :qasc
        'printext.qasc'
      when :stg
        'print.testing'
      when :prod
        ''
      else
        # ignore
      end
    when /or reports/
      case SdcEnv.env
      when :qacc
        'orext.qacc'
      when :qasc
        'orext.qasc'
      when :stg
        'or.staging'
      when :prod
        ''
      else
        # ignore
      end
    when /postage/
      case SdcEnv.env
      when :qacc
        'orext.qacc'
      when :qasc
        'orext.qasc'
      when :stg
        'or.staging'
      when :prod
        ''
      else
        # ignore
      end

    else
      # ignore
    end
  end

  def self.app(str)
    case(str.downcase)
    when /orders/
      :orders
    when /address/
      :addressbook
    when /or reports/
      :orreports
    when /postage/
      :postagetools
    else
      raise ArgumentError, "Healthcheck not supported for #{str}"
    end
  end

  def self.visit(str)
    env = env(str)
    app = app(str)
    super(env, app)
  end
end