require 'hashids'

module Hashable
  class Configuration
    attr_accessor :attr, :source, :model
    attr_reader :salt, :alphabet, :min_length, :callback

    def initialize(model)
      @attr   = :hash_id
      @source = :id
      @model  = model

      self.salt       = ''
      self.alphabet   = ::Hashids::DEFAULT_ALPHABET
      self.min_length = 4

      self.callback = :after_create
    end

    def salt=(value)
      raise ArgumentError.new('salt must be a String') unless value.is_a? String
      @salt = value
    end

    def alphabet=(value)
      raise ArgumentError.new('alphabet must be a String') unless value.is_a? String
      raise ArgumentError.new("alphabet can't include space") if value.include?(' ')

      @alphabet = value
    end

    def min_length=(value)
      raise ArgumentError.new('min_length must be a Fixnum') unless value.is_a? Fixnum
      raise ArgumentError.new('min_length must be > 0') unless value > 0

      @min_length = value
    end

    def callback=(value)
      @callback = value
      eval_callback
      @callback
    end

    private

    def eval_callback
      @model.class_eval("#{@callback} :generate_hashable")
    end
  end
end
