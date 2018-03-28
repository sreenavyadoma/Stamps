module Stamps
  module Database
    module MySql
      class Connection
        attr_reader :host, :username, :password, :log, :connection
        def initialize(host, username, password)
          set_instance_variables(binding, *local_variables)
        end

        def connect
          @connection = Mysql2::Client.new(host: host, username: username, password: password)
          connection.automatic_close = true
          SdcLog.info "Database Encoding: #{connection.encoding}"
          SdcLog.info "Database Info: #{connection.info}"
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