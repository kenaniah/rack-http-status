require "rack/utils"

module Rack
  module HTTP
    module Status
      class Status < Exception
        class << self
          attr_accessor :code, :description, :symbol
          alias_method :to_i, :code
          alias_method :to_sym, :symbol
          alias_method :to_s, :description
        end
        def to_i
          self.class.to_i
        end
        def to_s
          self.class.to_s
        end
        def to_sym
          self.class.to_sym
        end
      end
      Rack::Utils::SYMBOL_TO_STATUS_CODE.each do |symbol, code|
        name = Rack::Utils::HTTP_STATUS_CODES[code]
        klass = Class.new Status
        klass.code = code
        klass.symbol = symbol
        klass.description = name
        klass.freeze
        const_set name.gsub(/[ '-]/, ''), klass
      end
    end
  end
end
