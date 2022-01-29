class Invoice < ApplicationRecord
  validates :number, presence: true
  validates :total_value, presence: true
end
