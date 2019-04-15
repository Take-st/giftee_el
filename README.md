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


herokuにデプロイする方法
git push heroku master
(herokuのmasterブランチにpushする)
基本的にローカルのmasterブランチの内容をpushする仕様
一度ローカルでmasterにマージしてからpushしよう。

加えてデータベースのマイグレーションもする必要あり。
heroku run rails db:migrate