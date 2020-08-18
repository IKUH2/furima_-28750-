# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_one :profile, dependent: :destroy

## profile テーブル

| Column           | Type   | Options     |
| --------         | ------ | ----------- |
| nickname         | string | null: false |
| user_id          | string | null: false |
| first_name       | string | null: false |
| family_name      | string | null: false |
| first_name_kana  | string | null: false |
| family_name_kana | string | null: false |

### Association

- belongs_to :user

## items テーブル

| Column           | Type       | Options     |
| ------           | ------     | ----------- |
| name             | string     | null: false |
| information      | text       | null: false |
| price            | integer    | null: false |
| size             | references | null: false |
| trading_status   | enum       | null: false |
| item_id          | references | null: false,foreign_key: true| 

### Association

- has_many :item_imgs, dependent: :destroy

## item_imgs テーブル

| Column   | Type       | Options     |
| -------- | ------     | ----------- |
| url      | string     | null: false |
| item     | references | null: false |

### Association

- belongs_to :item

## buyer テーブル

| Column           | Type       | Options     |
| --------         | ------     | ----------- |
| user_id          | string     | null: false |
| item_id          | references | null: false,foreign_key: true| 

### Association

- belongs_to :user,item

## seller テーブル

| Column           | Type       | Options     |
| --------         | ------     | ----------- |
| Shipping address | string     | null: false |
| item_id          | references | null: false,foreign_key: true| 

### Association

- belongs_to :user,item