class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :describe
    validates :price, numericality: { message: 'Half-width number' }
    validates :price, inclusion: { in: 300..9_999_999, message: 'Out of setting range' }
    validates :user
  end

  with_options presence: true, numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :days_to_ship_id
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :days_to_ship
end
