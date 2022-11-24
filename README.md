# Apex HomeのER図

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| nickname           | string  | null: false |
| age                | integer | null: false |
| gender_id          | integer | null: false |
| rank_id            | integer | null: false |
| content            | text    | null: false |

### Association

- has_many :diaries
- has_many :diary_comments
- has_many :rooms
- has_many :rooms_comments
- belongs_to_active_hash :gender
- belongs_to_active_hash :rank

## diaries テーブル

| Column     |     Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| text       | text       | null: false                    |
| image      | text       |                                |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :diary_comments

## diary_comments テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| diary_comment     | text       | null: false                    |
| diary             | references | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :diary

## rooms テーブル

| Column     |     Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :room_comments

## room_comments テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| room_comment      | text       | null: false                    |
| diary             | references | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room