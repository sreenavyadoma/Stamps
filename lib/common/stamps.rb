module Stamps

  class BrowserField
    def initialize(browser)
      @browser = browser
    end

    protected
    def field_helper
      BrowserFieldHelper.instance #todo refactor to BatchHelper
    end
  end

  class Page
    def initialize(browser)
      @browser = browser
    end
  end

  def service_to_sym(str)
    str.downcase.tr('()', '').tr('/-', '_').strip.tr(' ', '_').to_sym
  end

  def service_to_words(str)
    str.tr('()', '').tr(' /-', ' ')
  end

  def to_sym(str, delim)
    #str.gsub(/[^0-9A-Za-z -]/, '').gsub(/\s+/,'_').gsub(/-+/, '_').downcase.to_sym
    (strip str.gsub(/\W/, delim), delim).downcase.to_sym
  end

  def strip(string, chars)
    chars = Regexp.escape(chars)
    string.gsub(/\A[#{chars}]+|[#{chars}]+\z/, "")
  end

end