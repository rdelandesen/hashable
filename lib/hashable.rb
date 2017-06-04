require 'hashable/version'
require 'hashable/active_record/base_methods'

##
# = Hashable
#
# == Example
#   class User < ActiveRecord::Base
#     hashable.config do |c|
#       c.attr       = :short_id
#       c.salt       = 'abcdef'
#       c.min_length = 8
#     end
#   end
#
module Hashable
end

::ActiveRecord::Base.extend(Hashable::ActiveRecord::BaseMethods)