export MYSQL_DATABASE_HOST=spree.ce4t98bbt7zi.us-east-1.rds.amazonaws.com
export MYSQL_DATABASE_PORT=3306
export MYSQL_DATABASE_NAME=spree
export MYSQL_DATABASE_USER_NAME=admin
export MYSQL_DATABASE_PASSWORD=admin123

rails db:create
rails db:import
rails db:seed AUTO_ACCEPT=1
rails spree_sample:load