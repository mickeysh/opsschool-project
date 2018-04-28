sudo apt-get update
apt-get install -y build-essential libpq-dev nodejs imagemagick
gem install rails -v 5.1.4
gem install bundler
rails _5.1.4_ new mystore
bundle install
rails g spree:install --user_class=Spree::User
