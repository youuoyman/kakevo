class Fixed < ApplicationRecord
  has_many :fixed_values, dependent: :destroy

  validates :name, presence: true
end
