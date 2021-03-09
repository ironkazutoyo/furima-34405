class RenameShippingAreaIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :shipping_area_id, :prefecture_id
  end
end
