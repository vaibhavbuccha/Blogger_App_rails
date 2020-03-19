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

### create models with migrations
```bash
rails g model User name:string email:string password_digest:string
```
 - the above command generate a model User and also a migartion file with fields name,email and password_digest .

- for create table we have to migrate database.
```bash
rake db:migrate
```

### create database entries using seeds
> *seeds* are use for create entries in database. for enteries we have to create a seed which tends to a perticular class with activerecods. for example
```rb
User.create(
		:name = "name",
		:email = "email@example.com",
		:password_digest = "password"
	)
``` 
- for create enter use the bellow command
```bash
rake db:seed
```
	
### Routes
```rb
get 'profile', to: 'pages#show' # it means  /profile is the route which redirect to pages#show page
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

 

