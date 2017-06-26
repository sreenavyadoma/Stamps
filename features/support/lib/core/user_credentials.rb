module Stamps
  class StampsUserCredentials
    attr_reader :db_connection, :modal_param
    def initialize(db_connection, modal_param)
      @db_connection = db_connection
      @modal_param = modal_param
    end

    def setup
      if modal_param.web_app == :mail || modal_param.web_app == :orders
        if (!ENV['USR'].nil? && ENV['USR'].downcase != 'default') && (!ENV['PW'].nil?)
          test_param[:username] = ENV['USR']
          test_param[:password] = ENV['PW']
        else
          # reset old usernames
          result = db_connection.query("select * from user_credentials where in_use=1 and date_add(in_use_time, INTERVAL 2 HOUR) < (CURTIME())")
          if result.size > 0
            result.each do |row|
              db_connection.prepare("UPDATE user_credentials SET user_credentials.in_use=0 where username=?").execute(row['username'])
            end
          end

          # get username
          result = db_connection.query("select * from user_credentials where test_env='#{modal_param.test_env}' and user_status='Active' and in_use=0")
          rand_num = rand(result.size)
          result.each_with_index do |row, index|
            if rand_num==index
              test_param[:username] = row['username']
              test_param[:password] = row['password']
            end
          end
          db_connection.prepare("UPDATE user_credentials SET user_credentials.in_use=1, user_credentials.in_use_time=CURTIME(), user_credentials.in_use_date=CURDATE() where username=?").execute(test_param[:username])
        end
      end
    end
  end
end