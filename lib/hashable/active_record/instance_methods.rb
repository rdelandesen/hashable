module Hashable
  module ActiveRecord
    module InstanceMethods
      def hashable
        self.class.hashable.model_instance = self
        self.class.hashable
      end

      def generate_hashable
        hashable.generate
      end
    end
  end
end