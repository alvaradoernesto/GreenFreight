class Load < ApplicationRecord
  belongs_to :user
  belongs_to :freight
  belongs_to :load_category
  belongs_to :special_requirement
end
