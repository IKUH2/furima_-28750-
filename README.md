# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| --------         | ------ | ----------- |
| name             | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| first_name       | string | null: false |
| last_name        | string | null: false |
| first_name_kana  | string | null: false |
| last_name_kana   | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :items, dependent: :destroy
- has_many :purchases, dependent: :destroy

## items テーブル

| Column           | Type       | Options     |
| ------           | ------     | ----------- |
| name             | string     | null: false |
| information      | text       | null: false |
| category         | integer    | null: false |
| item_condition   | integer    | null: false |
| delv_fee         | integer    | null: false |
| prefecture       | integer    | null: false |
| delv_time        | integer    | null: false |
| price            | integer    | null: false |
| item             | references | null: false |
| user_id          | integer    | null: false |


### Association

- has_one : purchases
- belongs_to :user

## purchases テーブル

| Column           | Type       | Options                       |
| --------         | ------     | ----------------------------- |
| user_id          | references |null: false, foreign_key: "user_id",class_name: "users" |
| item_id           | references |null: false, foreign_key: "item_id",class_name: "items" |

### Association

- has_one:purchase
- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column           | Type       | Options                       |
| --------         | ------     | ----------------------------- |
| purchase         | integer    | null: false, foreign_key::true|
| post_code        | string(7)  | null: false                   |
| prefecture_id    | integer    | null: false                   |
| city             | string     | null: false                   |
| house_number     | string     | null: false                   |
| building_name    | string     |                               |
| phone_number     | integer    | null: false                   |

### Association

- belongs_to :purchase


thx

- belongs_to :user!
- belongs_to :user
