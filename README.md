# テーブル設計

## users テーブル

| Column             | Type        | Options                   |
|--------------------|-------------|---------------------------|
| nickname           | string      | null: false               |
| email              | string      | null: false, unique: true |
| encrypted_password | string      | null: false               |
| last_name          | string      | null: false               |
| first_name         | string      | null: false               |
| furigana_last      | string      | null: false               |
| furigana_first     | string      | null: false               |
| date_of_birth      | date        | null: false               |



### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column           | Type        | Options                        |
|------------------|-------------|--------------------------------|
| item_name        | string      | null: false                    |
| explanation      | text        | null: false                    |
| category_id      | integer     | null: false                    |
| status_id        | integer     | null: false                    |
| delivery_fee_id  | integer     | null: false                    |
| prefecture_id    | integer     | null: false                    |
| day_to_ship_id   | integer     | null: false                    |
| selling_price    | integer     | null: false                    |
| user             | references  | null: false, foreign_key: true |



### Association

- belongs_to :user
- has_one :purchase



## purchases テーブル

| Column         | Type        | Options                        |
|----------------|-------------|--------------------------------|
| user           | references  | null: false, foreign_key: true |
| item           | references  | null: false, foreign_key: true |



### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## addresss テーブル

| Column          | Type        | Options                         |
|-----------------|-------------|---------------------------------|
| postal_code     | string      | null: false                     |
| prefecture_id   | integer     | null: false                     |
| municipality    | string      | null: false                     |
| house_number    | string      | null: false                     |
| building_name   | string      |                                 |
| phone_number    | string      | null: false                     |
| purchase        | references  | null: false, foreign_key: true  |



### Association

- belongs_to :purchase