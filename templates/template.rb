module Templates::XXX
  extend ActiveSupport::Concern

  included do
    api_accessible :basic do |t|
      t.add lambda { |model| model.id.to_s }, as: :id
    end
  end
end
