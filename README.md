# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| sei      | string | null: false |
| mei      | string | null: false |
| sei_kana | string | null: false |
| mei_kana | string | null: false |



### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type       | Options                        |
| ------        | ------     | -----------                    |
| image         | image      | null: false                    |
| name          | string     | null: false                    |
| explanation   | string     | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| deliver_fee   | string     | null: false                    |
| shipping_area | string     | null: false                    |
| shipping_day  | string     | null: false                    |
| price         | string     | null: false                    |
| users_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchases 



## purchases テーブル

| Column   | Type       | Options                        |
| ------   | ------     | -----------                    |
| users_id | references | null: false, foreign_key: true |
| day      | string     | null: false                    |
| items_id | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- belongs_to :items
- has_one :addresses



## adresses テーブル

| Column        | Type       | Options                        |
| ------        | ------     | -----------                    |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| municipality  | string     | null: false                    |
| adress        | string     | null: false                    |
| building_name | string     |                                |
| purchases_id  | references | null: false, foreign_key: true |


### Association

- belongs_to :purchases
