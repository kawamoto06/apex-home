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
1.トピックを作るからトピックを作成する  
2.トピック一覧からトピックを選択してコメントができる。  
## フォロー機能
1.ユーザーページからフォローができる  
## アプリケーションを作成した背景
ゲーム好きの友達がいて、新しく一緒に遊ぶ友達を見つける時にTwitterを利用することが多いと言っていたのですが、Twitterで見つけようとすると変な人と遊ぶことになったりして不快になることもあると言っていたので、相手の事を深く知れるゲーム専用のSNSがあればいいなと思い作成を始めました。  
## 洗い出した要件
https://docs.google.com/spreadsheets/d/1bzG783Fndeg1mL2MAqGgXcsDOpU_Ie8lYywkHoHvIKA/edit#gid=982722306  
## 実装した機能についての説明やGIFおよびその他
日記一覧は１ページにつき12件表示されてそれ以上は次のページに表示されます。  
[![Image from Gyazo](https://i.gyazo.com/49ea2f828c11831897b80f017a79f215.gif)](https://gyazo.com/49ea2f828c11831897b80f017a79f215)
トピック作成するとトピック一覧に推移し、コメントがついたトピックがトップページに表示されます。  
[![Image from Gyazo](https://i.gyazo.com/db6c399efd7c9ff3c54b9de1214ec53f.gif)](https://gyazo.com/db6c399efd7c9ff3c54b9de1214ec53f)  
[![Image from Gyazo](https://i.gyazo.com/aa01936251dd29a6ca5ebe80a361e446.gif)](https://gyazo.com/aa01936251dd29a6ca5ebe80a361e446)  
トピックも日記も表示しきれない件数になるとスクロールで表示されます。（新着日記の表示は10件まで）更にトピックと日記のタイトルが長すぎる場合ははみ出す部分をカットして表示されます。  
[![Image from Gyazo](https://i.gyazo.com/7b2add52880c7c6609f0c6b86a862619.gif)](https://gyazo.com/7b2add52880c7c6609f0c6b86a862619)  
マイページには自分の投稿した日記が表示されてフォロー一覧とフォロワー一覧ページにいけます。一覧ページからユーザーアイコンを押すとそのユーザーのマイページへ推移できます。  
[![Image from Gyazo](https://i.gyazo.com/e5722cbe383b0d8ddf1021481b37aedb.gif)](https://gyazo.com/e5722cbe383b0d8ddf1021481b37aedb)  
[![Image from Gyazo](https://i.gyazo.com/be922bfb95d148f323d264c1695dc548.gif)](https://gyazo.com/be922bfb95d148f323d264c1695dc548)


## 実装予定の機能
現在ユーザー検索機能、通報機能を検討中。  

## データベース設計
[![Image from Gyazo](https://i.gyazo.com/e10553e46bb3a3ab6e466f9d941be3ca.png)](https://gyazo.com/e10553e46bb3a3ab6e466f9d941be3ca)  
## 画面推移図
[![Image from Gyazo](https://i.gyazo.com/8cf10625b19e9ef8ddf32e5bb6c5fe20.png)](https://gyazo.com/8cf10625b19e9ef8ddf32e5bb6c5fe20)  
## 開発環境
・フロントエンド  
・バックエンド  
・インフラ  
・テスト  
・テキストエディタ  
・タスク管理  
## ローカルでの動作方法
以下のコマンド順に実行。  
% git clone https://github.com/kawamoto06/apex-home  
% cd xxxxx  
% bundle install  
% yarn install  
## 工夫したポイント
ゲーム用のSNSなのでお洒落って感じではなく楽しそうな見た目で、なおかつ幅広い層に使ってもらえるように落ち着いた色合いでフロントを作りました。  
このゲームをやっているユーザーがパソコンを起動したらまず始めにこのSNSを開く！そんなSNSを作ろうというイメージで作りました。



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
