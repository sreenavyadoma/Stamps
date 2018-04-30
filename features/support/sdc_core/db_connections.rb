module Stamps
  class MySqlConnDecorator < BasicObject
    attr_reader :host, :username, :password
    def initialize(host: nil, username: nil, password: nil)
      @connection = ::Mysql2::Client.new(host: host, username: username, password: password)
    end

    def method_missing(name, *args, &block)
      super unless @connection.respond_to?(name)
      @connection.send(name, *args, &block)
    end
  end

  class UserCredentialsConn < BasicObject
    def initialize
      host = data_for(:database, {})['mysql']['host']
      username = data_for(:database, {})['mysql']['username']
      password = data_for(:database, {})['mysql']['password']
      @connection = MySqlConnDecorator.new(host: host, username: username, password: password)
      @connection.automatic_close = true
      @connection.select_db('stamps')
    end

    def method_missing(name, *args, &block)
      super unless @connection.respond_to?(name)
      @connection.send(name, *args, &block)
    end
  end

  module SQLServer
    class Client
      attr_reader :server, :database, :username, :password, :port, :azure, :connection , :logger
      def initialize(server, database, port, username, password, azure, logger)
        @server = server
        @database = database
        @port = port
        @username = username
        @password = password
        @azure = azure
        @logger = logger
      end

      def connect
        @connection = TinyTds::Client.new(username: username, password: password, host: server,port: port, database: database, azure: azure)
        # logger.message "Database Encoding: #{connection.encoding}"
        # logger.message "Database Info: #{connection.info}"
      end

      def select_db(db)
        connection.select_db(db)
      end

      def query(query)
        connection.execute(query)
      end

      def close
        connection.close
      end

    end
  end

end