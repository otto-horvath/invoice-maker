class Invoice < ApplicationRecord
  validates :number, presence: true
end
