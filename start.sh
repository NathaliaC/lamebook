bundle install
bundle exec rails db:prepare
bundle exec rails db:seed
rm -f tmp/pids/server.pid
bundle exec rails tailwindcss:watch
bundle exec puma -C config/puma.rb