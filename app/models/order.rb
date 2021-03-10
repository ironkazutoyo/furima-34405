class Order < ApplicationRecord
  belongs_to :order_history

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
