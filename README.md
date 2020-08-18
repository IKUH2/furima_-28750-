# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

## users テーブル

| Column           | Type   | Options     |
| --------         | ------ | ----------- |
| user_id          | string | null: false |
| first_name       | string | null: false |
| family_name      | string | null: false |
| first_name_kana  | string | null: false |
| family_name_kana | string | null: false |
| nickname         | string | null: false |

## items テーブル

| Column           | Type       | Options     |
| ------           | ------     | ----------- |
| name             | string     | null: false |
| information      | text       | null: false |
| price            | integer    | null: false |
| size             | references | null: false |
| trading_status   | enum       | null: false |
| item_id          | string     | null: false |

## item_imgs テーブル

| Column   | Type       | Options     |
| -------- | ------     | ----------- |
| url      | string     | null: false |
| item     | references | null: false |

## buyer テーブル

| Column           | Type       | Options     |
| --------         | ------     | ----------- |
| buyer_id          | string     | null: false |
| items_id         | string     | null: false |
| delivery address | string     | null: false |

## seller テーブル

| Column           | Type       | Options     |
| --------         | ------     | ----------- |
| seller_id        | string     | null: false |
| items_id         | string     | null: false |
| Shipping address | string     | null: false |