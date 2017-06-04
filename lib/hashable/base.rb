require 'hashable/configuration'
require 'hashable/generation'

module Hashable
  class Base
    attr_reader   :configuration
    attr_accessor :model_instance

    def initialize(model)
      @model          = model
      @model_instance = nil

      @configuration  = Configuration.new(@model)
    end

    def config
      yield @configuration
    end

    def generate
      raise Exception.new('Model instance is missing') unless @model_instance.present?

      @generation ||= Generation.new(@configuration)
      e = @generation.encode(@model_instance.send(@configuration.source))

      @model_instance.send("#{@configuration.attr}=", e)
      @model_instance.save
    end
  end
end