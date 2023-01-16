class Change < ApplicationRecord
  has_many :change_values, dependent: :destroy
end
