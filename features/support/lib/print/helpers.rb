module Print

  module Postage
    class PrintObject < Stamps::Browser::BrowserObject
    end
  end

  class PostageHelper
    include Singleton
    include DataMagic

  end

end