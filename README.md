# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| --------         | ------ | ----------- |
| name             | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| first_name       | string | null: false |
| family_name      | string | null: false |
| first_name_kana  | string | null: false |
| family_name_kana | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :items, dependent: :destroy
- has_many :trade, dependent: :destroy

## items テーブル

| Column           | Type       | Options     |
| ------           | ------     | ----------- |
| name             | string     | null: false |
| information      | text       | null: false |
| category         | integer    | null: false |
| item_condition   | integer    | null: false |
| postage_payer    | integer    | null: false |
| ship_from        | integer    | null: false |
| preparation_day  | integer    | null: false |
| price            | integer    | null: false |
| item             | references | null: false |
| user_id          | integer    | null: false |

### Association

- belongs_to :user
- has_many :trade, dependent: :destroy

## trade テーブル

| Column           | Type       | Options                       |
| --------         | ------     | ----------------------------- |
| user_id          | string     |null: false, foreign_key: "user_id",class_name: "users" |
| item_id          | references |null: false, foreign_key: "item_id",class_name: "items" |

### Association
belongs_to :users,items 

## sold テーブル

| Column           | Type       | Options                       |
| --------         | ------     | ----------------------------- |
| trade_id         | integer    | null: false                   |
| post_code        | string(7)  | null: false                   |
| city             | string     | null: false                   |
| house_number     | string     | null: false                   |
| building_name    | string     |                               |
| phone_number     | integer    | null: false                   |

### Association

- belongs_to :trade