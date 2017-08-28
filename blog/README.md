# Multi-Author Blog

## Summary
I completed the following solo challenge during my fifth week on campus at Dev Bootcamp. I was provided with the pre-configured Sinatra server and Rake files and the vast majority of the CSS. I wrote the entirety of the database schema, models, views (CSS excluded), and controllers.

## Installation and use

1. Please use Ruby version 2.3.3. If you are using rbenv, the file `.ruby-version` will take care of this for you.
2. If you don't already have bundler installed, run `gem install bundler` from the command line.
3. Run `bundle install` to install all required gems for this application.
4. Run `bundle exec rake db:create` to create the database.
5. Run `bundle exec rake db:migrate` to migrate the database.
6. Run `bundle exec rake db:seed` to seed the database with dummy data. The end of the output of this command will supply you with dummy usernames and passwords to test out the application.
7. To start the server, run `bundle exec shotgun`.
8. Point your browser to `http://localhost:9393/` to test out the app.