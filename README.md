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

| Column             | Type   | Options                   |
| --------           | ------ | -----------               |    
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| sei                | string | null: false               |
| mei                | string | null: false               |
| sei_kana           | string | null: false               |
| mei_kana           | string | null: false               |
| birthday           | date   | null: false               |




### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type       | Options             |
| ------           | ------     | -----------         |
| name             | string     | null: false         |
| explanation      | text       | null: false         |
| category_id      | integer    | null: false         |
| status_id        | integer    | null: false         |
| deliver_fee_id   | integer    | null: false         |
| shipping_area_id | integer    | null: false         |          
| shipping_day_id  | integer    | null: false         |          
| price            | integer    | null: false         |          
| users            | references | foreign_key: true   |

### Association

- belongs_to :user
- has_one :purchas



## purchases テーブル

| Column   | Type       | Options           |
| ------   | ------     | -----------       |
| users    | references | foreign_key: true |
| items    | references | foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## adresses テーブル

| Column        | Type       | Options           |
| ------        | ------     | -----------       |
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| municipality  | string     | null: false       |
| adress        | string     | null: false       |
| building_name | string     |                   |
| purchases     | references | foreign_key: true |


### Association

- belongs_to :purchas
