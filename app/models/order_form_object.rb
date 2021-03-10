class OrderFormObject
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building, :tel_num, :order_history_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :municipality
    validates :address
    validates :tel_num, format: {with: /\A\d{10,11}\z/, message: 'Input only number'}
    # validates :order_history_id
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order_history = OrderHistory.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, tel_num: tel_num, order_history_id: order_history.id )
  end



end