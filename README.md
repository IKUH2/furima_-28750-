# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| --------         | ------ | ----------- |
| name             | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| nickname         | string | null: false |
| user_id          | string | null: false |
| first_name       | string | null: false |
| family_name      | string | null: false |
| first_name_kana  | string | null: false |
| family_name_kana | string | null: false |


### Association

- has_many :users, dependent: :put,delete,patch

## items テーブル

| Column           | Type       | Options     |
| ------           | ------     | ----------- |
| name             | string     | null: false |
| information      | text       | null: false |
| category         | references | null: false |
| item_condition   | references | null: false |
| postage_payer    | references | null: false |
| ship-from        | references | null: false |
| preparation_day  | references | null: false |
| price            | integer    | null: false |
| size             | references | null: false |
| trading_status   | enum       | null: false |
| item_id          | references | null: false |
| user_id          | string     | null: false |

### Association

- has_many :users, dependent: :get
- has_many :item_imgs, dependent: :destroy


## item_imgs テーブル

| Column   | Type       | Options     |
| -------- | ------     | ----------- |
| url      | string     | null: false |
| item     | references | null: false |

### Association

- belongs_to :item

## buyer テーブル

| Column           | Type       | Options                       |
| --------         | ------     | ----------------------------- |
| user             | string     |null: false, foreign_key: true |
| item             | references |null: false, foreign_key: true |
| card_number      | integer    | null: false                   |
| expiration_year  | integer    | null: false                   |
| security_code    | integer    | null: false                   |
| post_code        | integer(7) | null: false                   |
| city             | string     | null: false                   |
| house_number     | string     | null: false                   |
| building_name    | string     |                               |
| phone_number     | integer    | null: false                   |

### Association

- belongs_to :user,item

## seller テーブル

| Column           | Type       | Options                       |
| --------         | ------     | ----------------------------- |
| user             | string     |null: false, foreign_key: true |
| item             | references |null: false, foreign_key: true |
| Shipping address | string     | null: false                   |

### Association

- belongs_to :user,item