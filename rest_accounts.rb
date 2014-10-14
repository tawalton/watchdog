# rest_accounts.rb
require 'sinatra'
require 'redis'

@redis = Redis.new

#Add accounts to database from file
post '/accounts' do
  redis = Redis.new
  file = File.open('names').read
   file.each_line do |name|
     @redis.RPUSH('mynames', name)
   end
end

# Add account to account lst
# param :list => name of redis list used to store account id
# param :account_id => unique id of account 
post  '/account/:list/:account_name' do
  redis = Redis.new
  list = "#{params[:list]}"
  name = "#{params[:account_name]}"
  redis.RPUSH(list, name)
   "hello #{params[:list]}"
end

#Get the number accounts 
get '/count' do
  redis = Redis.new
  len = redis.LLEN('mynames')
end


#Get the accounts from the database
get '/accounts' do
  redis = Redis.new
  len = redis.LLEN('mynames')
  redis.LRANGE('mynames', 0, len)
end


#Delete an acount from the database
delete '/remove/:list/:account' do
  redis = Redis.new
  redis.LREM("#{params[:list]}",0, "#{params[:account]}")
end
