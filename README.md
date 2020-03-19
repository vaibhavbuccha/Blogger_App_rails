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

# create project

```bash
rails new blogger -d mysql
```


	




### install packges

1. **install bootstarp-sass** => add package in gem file with version.
```bash
gem 'bootstrap-sass', '~> 3.3.5'
```
> it was looking for 3.3.o version
> than we have to bundle install for update dependencies.



### Errors

1. **ActiveRecord::NoDatabaseError**  => this is due to database isn't found. for create database use the command mentioned below.
```bash
rake db:create
```
> the above command create database

 

