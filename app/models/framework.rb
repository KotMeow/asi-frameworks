class Framework < ApplicationRecord
  belongs_to :language
  validates :category, presence: true
  validates :name, presence: true, length: {in: 1..20}
  validates :description, presence: true, length: {in: 5..150}
  validates :year, presence: true, :inclusion => 1900..2100
end
