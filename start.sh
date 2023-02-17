bundle install
bundle exec rails db:prepare
bundle exec rails db:seed
bundle exec rails tailwindcss:watch
bundle exec puma -C config/puma.rb