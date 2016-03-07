module Stores
  include Stamps

  def volusion
    Stores::VolusionLoginPage.new @browser
  end
end