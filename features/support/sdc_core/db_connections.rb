module Stamps
  class MySqlConnDecorator < BasicObject
    require 'mysql2'

    attr_reader :host, :username, :password

    def initialize(host: nil, username: nil, password: nil)
      @connection = ::Mysql2::Client.new(host: host, username: username, password: password)
    end

    def respond_to?(name, include_private = false)
      @connection.respond_to?(name, include_private) || super
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

    def respond_to?(name, include_private = false)
      @connection.respond_to?(name, include_private) || super
    end

    def method_missing(name, *args, &block)
      super unless @connection.respond_to?(name)
      @connection.send(name, *args, &block)
    end
  end

  class SQLServerClient
    require 'tiny_tds'

    attr_reader :host, :database, :username, :password, :port, :azure, :connection

    def initialize(username: nil, password: nil, server: nil, port: nil, database: nil, azure: nil)
      @connection = TinyTds::Client.new( username: username, password: password, host: server, port: port, database: database, azure: azure)
    end

    def respond_to?(name, include_private = false)
      super || @connection.respond_to?(name, include_private)
    end

    def method_missing(name, *args, &block)
      super unless @connection.respond_to?(name)
      @connection.send(name, *args, &block)
    end
  end

  class PartnerPortalDB < BasicObject
    def initialize
      server = data_for(:sql_server_pp, {})['server']
      database = data_for(:sql_server_pp, {})['database']
      port = data_for(:sql_server_pp, {})['port']
      username = data_for(:sql_server_pp, {})['username']
      password = data_for(:sql_server_pp, {})['password']
      azure = data_for(:sql_server_pp, {})['azure']
      @connection = SQLServerClient.new(server: server, database: database, username: username, password: password, port: port, azure:azure)
    end

    def respond_to?(name, include_private = false)
      super || @connection.respond_to?(name, include_private)
    end

    def method_missing(name, *args, &block)
      super unless @connection.respond_to?(name)
      @connection.send(name, *args, &block)
    end
  end

end


