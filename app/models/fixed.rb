class Fixed < ApplicationRecord
  has_many :fixed_values, dependent: :destroy
end
