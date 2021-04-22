# テーブル設計

## users

| Column | Type | Options |
| ------ | ---- | ------- |
| family_name | string | null: false |
| last_name | string | null: false |
| phone_number | string | null: false |
| email | string | null: false |
| encrypted_password | string | null: false |
| company_name | string | null: false

### Association

- has_many :user_maps
- has_many :maps, through: user_spots
- has_many :plans

## maps

| Column | Type | Options |
| ------ | ---- | ------- |
| spot_name | string | null: false |
| address | string | null: false |
| latitude | float | null: false |
| longitude | float | null: false |
| text | text |        |

### Association

- has_many :user_spots
- has_many :users, through: user_spots
- has_many :plans

## user_maps

| Column | Type | Options |
| ------ | ---- | ------- |
| user | references | null: false, foreign_key: true |
| map | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :map

## plans

| Column | Type | Options |
| ------ | ---- | ------- |
| content | text |  |
| user | references | null: false, foreign_key: true |
| map | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :map