require 'hashable/active_record/instance_methods'
require 'hashable/base'

module Hashable
  module ActiveRecord
    module BaseMethods
      def hashable
        include InstanceMethods unless defined? @base
        @base ||= Hashable::Base.new(self)
      end
    end
  end
end
