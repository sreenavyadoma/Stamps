module Stores
  include Stamps

  def volusion
    VolusionLoginPage.new @browser
  end
end