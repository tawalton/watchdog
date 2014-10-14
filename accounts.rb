require 'sinatra'
require 'redis'

# Add accounts to database from file
# post '/accounts' do
#   redis = Redis.new
#   file = File.open('names').read
#   file.each_line do |name|
#     redis.RPUSH('mynames', name)
#   end
# end

# Add account to account lst
# param :account_list => name of redis list used to store account id
# param :account_id => unique id of account
post '/:account_list/accounts/:account_id' do
  redis = Redis.new
  list = "#{params[:account_list]}"
  id = "#{params[:account_id]}"
  redis.RPUSH(list, id)
end

# Get the number of accounts
# param :account_list => name of redis list used to store account id
get '/:account_list/accounts/count' do
  redis = Redis.new
  list = "#{params[:account_list]}"
  redis.LLEN(list)
end

# Get the accounts from the database
# param :account_list => name of redis list used to store account id
get '/:account_list/accounts' do
  redis = Redis.new
  list = "#{params[:account_list]}"
  len = redis.LLEN(list)
  redis.LRANGE(list, 0, len)
end

# Delete an acount from the database
# param :account_list => name of redis list used to store account id
# param :account_id => id of account to be removed from account list
delete '/:account_list/accounts/:account_id' do
  redis = Redis.new
  list = "#{params[:account_list]}"
  account = "#{params[:account_id]}"
  redis.LREM(list, 0, account)
end
