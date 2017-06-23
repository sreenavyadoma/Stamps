module Stamps
  module Database
    module MySql
      class StampsMySqlConnection
        attr_reader :host, :username, :password, :logger, :connection
        def initialize(host, username, password, logger)
          @host=host
          @username=username
          @password=password
          @logger = logger
        end

        def connect
          @connection = Mysql2::Client.new(host: host, username: username, password: password)
          connection.automatic_close=true
          logger.message "Database Encoding: #{connection.encoding}"
          logger.message "Database Info: #{connection.info}"
        end

        def select_db(db)
          connection.select_db(db)
        end

        def query(sql)
          connection.query(sql)
        end

        # returns a statement object
        def prepare(sql)
          connection.prepare(sql)
        end

        def close
          connection.close
        end
      end
    end
  end
end