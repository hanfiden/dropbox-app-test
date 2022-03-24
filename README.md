# README

* Ruby version: 3.1.1
* Rails version: 7.0.2

* Gem Added:

      gem 'dotenv-rails', groups: [:development, :test]
      gem 'simple_form'
      gem 'faker'
      gem 'tailwindcss-rails'

* How to run:
```console
git clone https://github.com/hanfiden/dropbox-app-test.git
cd dropbox-app-test
code .

rails db:create
bundle install
yarn install
rails db:migrate
rails db:seed

touch .env
echo '.env*' >> .gitignore
```
Add DROPBOX_APP_KEY=******** to .env

Launch a localhost server with:
```console
bin/dev
```

* Deployment instructions:
```console
heroku login
heroku create
heroku config:set DROPBOX_APP_KEY=********

git push heroku main

heroku run rails db:migrate
heroku run rails db:seed
```
