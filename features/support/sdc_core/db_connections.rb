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

  class SQLServerClient
    attr_reader :server, :database, :username, :password, :port, :azure, :connection , :logger
    def initialize(username: nil, password: nil, host: nil, port: nil, database: nil, azure: nil)
      @connection = TinyTds::Client.new(username: username, password: password, host: server,port: port, database: database, azure: azure)
    end

    def method_missing(name, *args, &block)
      super unless @connection.respond_to?(name)
      @connection.send(name, *args, &block)
    end
  end

  class SomeUsernameData < BasicObject
    def initialize
      server = data_for(:sql_server, {})['server']
      database = data_for(:sql_server, {})['database']
      port = data_for(:sql_server, {})['port']
      username = data_for(:sql_server, {})['username']
      password = data_for(:sql_server, {})['password']
      azure = data_for(:sql_server, {})['azure']
      @connection = SQLServerClient.new(server, database, port, username, password, azure)
    end

    def method_missing(name, *args, &block)
      super unless @connection.respond_to?(name)
      @connection.send(name, *args, &block)
    end
  end

end


