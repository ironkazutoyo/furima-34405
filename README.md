# テーブル設計

## usersテーブル

|Column                   |Type   |Options                  |
|-------------------------|-------|-------------------------|
|nickname                 |string |null: false              |
|email                    |string |null: false, unique: true|
|encrypted_password       |string |null: false              |
|first_name               |string |null: false              |
|last_name                |string |null: false              |
|first_name_kana          |string |null: false              |
|last_name_kana           |string |null: false              |
|birthday                 |date   |null: false              |

### Association
- has_many :items
- has_one :buyers
- has_many :buys


## itemsテーブル

|Column            |Type      |Options    |
|------------------|----------|-----------|
|name              |string    |null: false|
|describe          |text      |null: false|
|category_id       |integer   |null: false|
|status_id         |integer   |null: false|
|shipping_charge_id|integer   |null: false|
|shipping_area_id  |integer   |null: false|
|days_to_ship_id   |integer   |null: false|
|price             |integer   |null: false|
|user              |references|null: false|

### Association
- belongs_to :user
- has_one :buyers
- has_one :buys


## buyersテーブル

|Column             |Type      |Options    |
|-------------------|----------|-----------|
|postal_code        |string    |null: false|
|prefecture_id      |integer   |null: false|
|municipality       |string    |null: false|
|address            |string    |null: false|
|building           |string    |           |
|tel_num            |string    |null: false|

### Association
- belongs_to :user
- belongs_to :item
- has_many :buys