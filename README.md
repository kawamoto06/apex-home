# アプリケーション名
APEX-HOME  
# アプリケーション概要
apexユーザーがゲーム外でも交流を持ち一緒に遊ぶ友達を見つけれるアプリケーション  
# URL
https://apex-home.onrender.com

# テスト用アカウント
メールアドレス：test@test.com  
パスワード：0029test  
メールアドレス：test@test2.com  
パスワード：0029test  
メールアドレス：test@test3.com  
パスワード：0029test  
# 利用方法
## 日記機能
1.トップページから新規登録を行う  
2.日記を書くから日記を投稿する  
3.他の人が書いた日記にコメントができる  
## トピック機能





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
| content            | text    |             |

### Association

- has_many :diaries
- has_many :diary_comments
- has_many :topics
- has_many :topic_comments
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

## topics テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :topic_comments

## topic_comments テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| topic_comment     | text       | null: false                    |
| diary             | references | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room
