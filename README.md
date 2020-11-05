# DB 設計

## users table

| Column             | Type   | Options                    |
|--------------------|--------|----------------------------|
| nickname           | string | null: false , unique: true |
| email              | string | null: false , unique: true |
| encrypted_password | string | null: false                |
| last_name          | string | null: false                |
| first_name         | string | null: false                |
| last_name_kana     | string | null: false                |
| first_name_kana    | string | null: false                |
| birth_date         | date   | null: false                |


### Association
* has_many :items
* has_many :purchase



## items table

| Column                 | Type       | Options                        |
|------------------------|------------|--------------------------------|
| item_name              | string     | null: false                    |
| item_description       | text       | null: false                    |
| category_id            | integer    | null: false                    |
| condition_id           | integer    | null: false                    |
| shipping_fee_id        | integer    | null: false                    |
| ship_from_id           | integer    | null: false                    |
| days_until_shipping_id | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |


### Association
* belongs_to :user
* has_one :purchase



## purchase table

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association
* belongs_to :user
* has_one :item
* has_many :address



## address table

| Column        | Type    | Options                    |
|---------------|---------|----------------------------|
| post_code     | string  | null: false                |
| prefecture_id | integer | null: false                |
| city          | string  | null: false                |
| house_number  | string  | null: false                |
| building_name |         |                            |
| phone_number  | string  | null: false , unique: true |


### Association
* belongs_to :purchase