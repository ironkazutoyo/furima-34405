# テーブル設計

## usersテーブル

|Column         |Type   |Options    |
|---------------|-------|-----------|
|nickname       |string |null: false|
|email          |string |null: false|
|password       |string |null: false|
|first_name     |string |null: false|
|last_name      |string |null: false|
|first_name_kana|string |null: false|
|last_name_kana |string |null: false|
|birth_year     |integer|null: false|
|birth_month    |integer|null: false|
|birth_day      |integer|null: false|

### Association
- has_many :items
- has_many :buys


## itemsテーブル

|Column         |Type      |Options    |
|---------------|----------|-----------|
|name           |string    |null: false|
|describe       |text      |null: false|
|category       |string    |null: false|
|status         |string    |null: false|
|shipping_charge|string    |null: false|
|shipping_area  |string    |null: false|
|days_to_ship   |string    |null: false|
|price          |integer   |null: false|
|user           |references|null: false|

### Association
- belongs_to :user
- has_one :buy


## buysテーブル

|Column          |Type      |Options    |
|----------------|----------|-----------|
|card_num        |integer   |null: false|
|expiration_month|integer   |null: false|
|expiration_year |integer   |null: false|
|security_code   |integer   |null: false|
|postal_code     |string    |null: false|
|prefecture      |string    |null: false|
|municipality    |string    |null: false|
|address         |string    |null: false|
|building        |string    |           |
|tel_num         |string    |null: false|
|user            |references|           |
|item            |references|           |



### Association
- belongs_to :user
- belongs_to :item