require 'hashids'

module Hashable
  class Generation
    def initialize(configuration)
      @configuration = configuration

      @hashids = ::Hashids.new(
          @configuration.salt,
          @configuration.min_length,
          @configuration.alphabet,
      )
    end

    def encode(id)
      @hashids.encode(id)
    end
  end
end