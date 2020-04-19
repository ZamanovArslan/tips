# Tips

## About
App where you can share your life experience with other people (like tips for you in youth)

## Getting Started

### Prepare dependencies

Some gems have native extensions.
You should have GCC installed on your development machine.

* `phantomjs` - to run Javascript unit tests
* `graphviz` - to generate Entity-Relationship Diagram
* `node` - JavaScript runtime

Setup required dependencies from `Brewfile`:
```bash
brew tap Homebrew/bundle
brew bundle
```

### Bootstrap application

1. Clone application as new project with original repository named "rails-base".

   ```bash
   git clone git://github.com/fs/rails-base.git --origin rails-base [MY-NEW-PROJECT]
   ```

2. Create your new repo on GitHub and push master into it. Make sure master branch is tracking origin repo.

  ```bash
  git remote add origin git@github.com:[MY-GITHUB-ACCOUNT]/[MY-NEW-PROJECT].git
  git push -u origin master
  ```

3. Run setup script

  ```bash
  bin/setup
  ```

4. Run test and quality suits to make sure all dependencies are satisfied and applications works correctly before making changes.

  ```bash
  bin/test
  ```

5. Run app

  ```bash
  bin/server
  ```

6. Update README

  Do not forget to update application `README.md` file with detailed information based on the
  existing template.

  ```bash
  mv doc/README_TEMPLATE.md README.md
  # update README.md
  git commit -am "Update README.md"
  ```

## Deployment

### Heroku

Out of the box Rails Base ready to be deployed to [Heroku.com](http://heroku.com).

* [Heroku Postgres](https://www.heroku.com/postgres) add-on will be used for database.
* [SendGrid](https://devcenter.heroku.com/articles/sendgrid#ruby-rails) add-on required to be able to send emails.
* [NewRelic](https://devcenter.heroku.com/articles/newrelic#ruby-installation-and-configuration) add-on could be used to monitor application performance.
* [Rollbar](https://elements.heroku.com/addons/rollbar) add-on could be used to application errors.

```bash
heroku create --addons=heroku-postgresql,sendgrid,newrelic,rollbar --remote staging rails-base-example
heroku config:add HOST="rails-base-example.herokuapp.com" MAILER_SENDER_ADDRESS="noreply@rails-base-example.herokuapp.com" NEW_RELIC_APP_NAME="Rails Base"
git push staging master
heroku run rake db:schema:load
heroku open
```
