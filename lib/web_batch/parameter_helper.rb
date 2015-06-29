module Batch
  class ParameterHelper #todo refactor to helper module within batch
    include Singleton
    include DataMagic

    def default_sign_in_credentials
      @sign_in_credentials ||= data_for(:login_credentials, {})[ENV['URL']]
    end

    def username
      default_sign_in_credentials
      username = @sign_in_credentials['username']
      "username:    #{username}"
      username
    end

    def password
      default_sign_in_credentials
      password = @sign_in_credentials['password']
      "password:    #{password}"
      password
    end

    def sign_in_credentials
      @sign_in_credentials
    end
  end
end