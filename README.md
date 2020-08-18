# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :seller_items, foreign_key: "seller_id", 　class_name: "items"
- has_many :buyer_items, foreign_key: "buyer_id", 　class_name: "items"
- has_one :profile, dependent: :destroy

## profile テーブル

| Column           | Type   | Options     |
| --------         | ------ | ----------- |
| user_id          | string | null: false |
| first_name       | string | null: false |
| family_name      | string | null: false |
| first_name_kana  | string | null: false |
| family_name_kana | string | null: false |
| nickname         | string | null: false |

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
| item_id          | string     | null: false |

### Association

- has_many :item_imgs, dependent: :destroy

## item_imgs テーブル

| Column   | Type       | Options     |
| -------- | ------     | ----------- |
| url      | string     | null: false |
| item     | references | null: false |

### Association

- belongs_to :user

## buyer テーブル

| Column           | Type       | Options     |
| --------         | ------     | ----------- |
| buyer_id          | string    | null: false |
| items_id         | string     | null: false |
| delivery address | string     | null: false |

### Association

- belongs_to :user

## seller テーブル

| Column           | Type       | Options     |
| --------         | ------     | ----------- |
| seller_id        | string     | null: false |
| items_id         | string     | null: false |
| Shipping address | string     | null: false |

### Association

- belongs_to :user