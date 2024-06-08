
<h1 align="center">
  Vale Desconto - App in Rails 7 using Bootstrap, Ransack, Devise, Kaminari, RSpec and Rubocop
</h1>

<p align="center">
  <a href="#1-the-project">The project</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#2-walkthrough">Walkthrough</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#3-bootstrap">Bootstrap</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#4-ransack">Ransack</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#5-devise">Devise</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#6-kaminari">Kaminari</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#7-rspec">RSpec</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#8-rubocop">Rubocop</a>&nbsp;&nbsp;&nbsp;
</p>

---

<br />

## 1. The project

Project developed as a phase of a selection process that consists of registering product and discount and create sales according with type of discount chose. This project using `Ruby 3.3.0`, `Rails 7.1.3.3` and SQLite as database.

Others technologies and gems:
- Bootstrap;
- Ransack;
- Devise;
- Kaminari;
- Rspec;
- Rubocop

## 2. Walkthrough

Quick step by step guide on how to use the system. Make sure you have **git** installed on your machine and run:

```sh
git clone git@github.com:eltonsantos/vale-desconto.git
cd vale-desconto
bundle
rails db:migrate
rails db:seed
rails s
```

In browser, go to **http://localhost:3000**

The email and password default are: **admin@admin.com** and **123456**

Enjoy!


## 3. Bootstrap

This project uses Bootstrap as the default style framework. Here is used the bootstrap gem that can be found through this [link](https://github.com/twbs/bootstrap-rubygem).

Add the following to the Gemfile:

```ruby
gem "bootstrap"
```

**bundle install** and restart your server to make the files available through the pipeline.

Import Bootstrap styles in *app/assets/stylesheets/application.scss*:

```ruby
# Custom bootstrap variables must be set or imported *before* bootstrap.
@import "bootstrap";
```

Make sure the file has **.scss** extension (or **.sass** for Sass syntax). If you have just generated a new Rails app, it may come with a .css file instead. If this file exists, it will be served instead of Sass, just rename it.

Add this lines in *config/importmap.rb*:

```ruby
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
```

Finally, add this line to the end of the file *config/initializers/assets.rb*:

```ruby
Rails.application.config.assets.precompile += %w(bootstrap.min.js popper.js)
```

## 4. Ransack

This project uses the ransack gem which is Object-based searching. The gem can be found via this [link](https://github.com/activerecord-hackery/ransack). To configure it is simple:

```ruby
gem "ransack"
```

In your controller, add:

```ruby
def index
  @q = YourController.ransack(params[:q])
  @some = @q.result
end
```

And your view, add some like that:

```ruby
<%= search_form_for @q do |f| %>

  # Search if the name field contains...
  <%= f.label :name_cont %>
  <%= f.search_field :name_cont %>

  # Search if an associated articles.title starts with...
  <%= f.label :articles_title_start %>
  <%= f.search_field :articles_title_start %>

  # Attributes may be chained. Search multiple attributes for one value...
  <%= f.label :name_or_description_or_email_or_articles_title_cont %>
  <%= f.search_field :name_or_description_or_email_or_articles_title_cont %>

  <%= f.submit %>
<% end %>
```

## 5. Devise

To ensure these instructions are up to date, if anything goes wrong please [reference the official documentation](https://github.com/heartcombo/devise).

Add the following to the Gemfile:

```ruby
gem "devise"
gem "letter_opener_web" # To easily see the emails devise sends in development
```

Add this to `config/application.rb` to configure devises layout:

```sh
config.to_prepare do
  Devise::SessionsController.layout "auth"
  # DeviseInvitable::RegistrationsController.layout "auth"
  # Devise::InvitationsController.layout "auth"
  Devise::RegistrationsController.layout "auth"
  Devise::ConfirmationsController.layout "auth"
  Devise::UnlocksController.layout "auth"
  Devise::PasswordsController.layout "auth"
  Devise::Mailer.layout "mailer"
end
```

Add these to `app/controllers/application_controller.rb` to protect all routes by default and allow some extra params:

```ruby
before_action :configure_permitted_parameters, if: :devise_controller?
before_action :authenticate_user!

protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name terms_and_conditions])
  devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name])
end
```

Generate the `User` model, and add two additional fields for `first_name` and `last_name`.

```sh
$ rails generate devise:install
$ rails generate devise User
```

#### Setting up letter opener

```ruby
# append to `config/environments/development.rb`
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
config.action_mailer.delivery_method = :letter_opener
```

#### Generate the devise views

This is so we can customise them and add our additional fields in.

```sh
$ rails generate devise:views
```

Go into the views and add additional fields.

#### Create a protected route and write a request spec for it

```sh
$ bin/rails g controller Pages home
$ bin/rails generate rspec:request pages
```

## 6. Kaminari

This project uses the kaminari to work with pagination. The gem can be found via this [link](https://github.com/kaminari/kaminari).

Just add:

```ruby
gem "kaminari"
```

To configure run:

```sh
rails g kaminari:config
```

And if want use themes (see more here: [kaminari_themes](https://github.com/amatsuda/kaminari_themes)) just run:

```sh
rails g kaminari:views THEME
```

Where is THEME can be: default, bootstrap, bulma, materialize...
To see the full list of available themes, take a look at the themes repository, or just hit the generator without specifying THEME argument.

## 7. RSpec

To ensure these instructions are up to date, if anything goes wrong please [reference the official documentation](https://github.com/rspec/rspec-rails).

Add the following to the Gemfile:

```ruby
group :development, :test do
  gem 'rspec-rails', '~> 6.1.0'
end
```

Run **bundle** and next run the following commands:

```sh
$ rails generate rspec:install
```

Create into spec folder *models/user_spec.rb* and add some tests, example:

```ruby
require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Is valid with valid attributes' do
    user = User.new(
      name: 'Fulano de Tal Pereira',
      cpf: '123.456.789-10',
      birth_date: '1990-01-01',
      address: 'Rua Alguma coisa',
      address_number: '346',
      neighborhood: 'Passaré',
      city: 'Fortaleza',
      state: 'CE',
      zipcode: '12345-678',
      home_phone: '85991015588',
      work_phone: '85992051595',
      salary: 3000.00
    )
    expect(user).to be_valid
  end
end
```

Finally, just run:

```ruby
bundle exec rspec
```

## 8. Rubocop

This project use the rubocop gem. RuboCop is a extension focused on enforcing Rails best practices and coding conventions. To know more, visit the [link official](https://github.com/rubocop/rubocop).

Add it on Gemfile on **group :development**:

```ruby
gem "rubocop-rails", require: false
```

Can install optionally the rubocop shopify conventions and best practices:

```ruby
gem "rubocop-shopify", require: false
```

Run **bundle** and it on *.rubocop.yml*:

```ruby
inherit_gem:
  rubocop-shopify: rubocop.yml
require:
  - rubocop-rails

AllCops:
  TargetRubyVersion: 3.3.0
```

In case of error in the rubocop, remove Gemfile.lock and lock the versions on Gemfile and bundle again, example:

```ruby
gem "rubocop-shopify", "~> 2.3", require: false
gem "rubocop-rails", "~> 2.12", ">= 2.12.4", require: false
```

Finally run:

```sh
rubocop
```

To automatically correct

```sh
rubocop -A
```

## Author

<h3 align="center">
  <img style="border-radius: 50%" src="https://avatars3.githubusercontent.com/u/1292594?s=460&u=0b1bfb0fc81256c59dc33f31ce344231bd5a5286&v=4" width="100px;" alt=""/>
  <br/>
  <strong>Elton Santos</strong> 🚀
  <br/>
  <br/>

 <a href="https://www.linkedin.com/in/eltonmelosantos" alt="LinkedIn" target="blank">
    <img src="https://img.shields.io/badge/-LinkedIn-blue?style=flat-square&logo=Linkedin&logoColor=white" />
  </a>

  <a href="mailto:elton.melo.santos@gmail.com?subject=Olá%20Elton" alt="Email" target="blank">
    <img src="https://img.shields.io/badge/-Gmail-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:elton.melo.santos@gmail.com" />
  </a>

<br/>

Made with ❤️ by Elton Santos 👋🏽 [Contact me!](https://eltonmelosantos.com.br/)

</h3>
