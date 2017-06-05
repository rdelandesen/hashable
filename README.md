# Hashable
**Hashable** allows you to generate and save hash id for **[ActiveRecord models](http://guides.rubyonrails.org/active_record_basics.html)**. 

**For example :**

| ID   | Hash ID   |
|------|-----------|
| `1`  | `ejRe`    |
| `2`  | `bk5e`    |
| `3`  | `el5a`    |

**Hashable** uses [HashIds.rb](https://github.com/peterhellberg/hashids.rb) encoding.

**N.B.** If you don't need to save hash id in database, you can use [HashId Rails](https://github.com/jcypret/hashid-rails).

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'hashable', github: 'rdelandesen/hashable'
```

And then execute:

```bash
$ bundle
```

## Usage

### Model setup

```ruby
class User < ActiveRecord::Base
  hashable.config do |c|
    c.attr = :hash_id
    
    # Optional
    c.source     = :id
    c.salt       = 'replaceit' # by default => ''
    c.alphabet   = 'abcdefxyz' # by default => all letters + 0..9
    c.min_length = 4 # by default
  end
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rdelandesen/hashable.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
