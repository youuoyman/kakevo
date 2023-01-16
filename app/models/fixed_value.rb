class FixedValue < ApplicationRecord
  has_many :fixed_values, dependent: :destroy
end
