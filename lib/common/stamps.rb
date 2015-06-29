module Stamps
  #require_relative 'field_helper'

  class Page
    include FieldHelper
    def initialize(browser)
      @browser = browser
    end
  end

  def format_address_arr(address_array)
    address = ""
    if address_array.is_a?(Array)
      address_array.each_with_index { |element, index|
        if index==address_array.size-1
          address = address + element.to_s.strip
        else
          address = address + element.to_s.strip + "\n"
        end
      }
    else
      raise "Unsupported address format."
    end
    log address
    address
  end

  def formatAddress(address)
    if address.is_a?(Hash)
      return "#{address['name'].strip}\n#{address['company'].strip}\n#{address['street_address'].strip}\n #{address['city'].strip}, #{address['state'].strip}. #{address['zip'].strip}"
    elsif address.is_a?(Array)
      return format_address_arr(address)
    elsif address.include?(',')
      return format_address_arr address.split(/,/)
    elsif address.is_a?(String)
      return address
    else
      raise "Unsupported address format."
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