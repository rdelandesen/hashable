class User < ApplicationRecord
  hashable.config do |c|
    c.attr       = :short_id
    c.source     = :id
    c.salt       = '123456'
    c.min_length = 3
  end
end
