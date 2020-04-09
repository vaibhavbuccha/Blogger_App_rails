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
---
```bash
rails g model User name:string email:string password_digest:string
```
 - the above command generate a model User and also a migartion file with fields name,email and password_digest .

- for create table we have to migrate database.
```bash
rake db:migrate
```
---

### create database entries using seeds
---
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
---


### Routes
---
```rb
get 'profile', to: 'pages#show' # it means  /profile is the route which redirect to pages#show page
```
---

### install packges
---
1. **install bootstarp-sass** => add package in gem file with version.
```bash
gem 'bootstrap-sass', '~> 3.3.5'
gem 'bcrypt', '~> 3.1.7'
```
> it was looking for 3.3.o version
> than we have to bundle install for update dependencies.

---

### Errors
---
1. **ActiveRecord::NoDatabaseError**  => this is due to database isn't found. for create database use the command mentioned below.
```bash
rake db:create
```
> the above command create database
---


### debugging
---
```rb
abort checkemail.inspect

```

### figaro
it allows us to use env varieables
for install it .
> bundle exec figaro install

### Send Mail using Mailer

* step1
Directory *config/enviroments/development.rb* and **config.action_mailer.raise_delivery_errors = false** change this to **true**.

* step2
Append code at the end of the file.
```rb


 config.action_mailer.delivery_method = :smtp  # this tells thats we are using smtp for set mails

# this is the basic configuration for mail send via smtp
 config.action_mailer.smtp_settings = {
     address:              'smtp.gmail.com',
     port:                 587,
     domain:               'example.com',
     user_name:             ENV['gmail_username'], # these are set as enviroment variables
     password:              ENV['gmail_password'],
     authentication:       'plain'
  }

 config.action_mailer.default_url_options = {host: "localhost:3000"}

```

* step3
Create rails mailer
```sh
rails g mailer <mailer_name>  <method_name>
```
> It creates some files

## Image Upload using active storage
```
 rails active_storage:install
```
It create a migration file
```
  rails db:migrate
```
set relationship in models
```
	has_one_attached:image
```

Add file field in our form

```rb
<div class="form-group" >
  <%= label_tag :image %>
  <%= f.file_field :image , class: "form-conmtrol"  %>
</div>
```
set permission for image in Controller
```rb
	params.require(:user).permit(:name,:email,:password,:im age)

```

preview Image

```rb
image_tag obj.image

```



## migration

add field to existing table
```sh
rails generate migration add_fieldname_to_tablename fieldname:string

rake db:migrate
```
