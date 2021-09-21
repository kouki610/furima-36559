# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------  | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_kananame     | string  | null: false               |
| last_kananame      | string  | null: false               |
| birthday           | date    | null: false               |


### Association

- has_many :items
- has_many :orders



## items テーブル

| Column                            | Type       | Options                        |
| --------------------------------- | ---------- | ------------------------------ |
| name                              | string     | null: false                    |
| explanation                       | text       | null: false                    |
| category_id                       | integer    | null: false                    |
| status_id                         | integer    | null: false                    |
| lord_id                           | integer    | null: false                    |
| area_id                           | integer    | null: false                    |
| scheduled_delivery_id             | integer    | null: false                    |
| price                             | integer    | null: false                    |
| user                              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false ,foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| area_id            | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :order