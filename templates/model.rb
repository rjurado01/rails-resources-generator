class XXX
  include Mongoid::Document
  include Mongoid::Timestamps

  acts_as_api
  include Templates::XXX
end
