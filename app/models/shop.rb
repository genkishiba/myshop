class Shop < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :tel, presence: true
  validates :introduce, presence: true
end
