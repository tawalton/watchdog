require 'sinatra'
require 'redis'


put '/:account_id/servers/:count' do
  redis = Redis.new
  account_id = "#{params[:account_id]}"
  count = "#{params[:count]}"
  redis.HMSET(account_id, servers, count) 
end

put '/:account_id/loadBalancers/:count' do
  redis = Redis.new
  account_id = "#{params[:account_id]}"
  count = "#{params[:count]}"
  redis.HMSET(account_id, "loadBalancers", count) 
end

put '/:account_id/bigDataClusters/:count' do
  redis = Redis.new
  account_id = "#{params[:account_id]}"
  count = "#{params[:count]}"
  redis.HMSET(account_id, "bigDataClusters", count) 
end

put '/:account_id/dataBases/:count' do
  redis = Redis.new
  account_id = "#{params[:account_id]}"
  count = "#{params[:count]}"
  redis.HMSET(account_id, "dataBases", count) 
end

put '/:account_id/volumes/:count' do
  redis = Redis.new
  account_id = "#{params[:account_id]}"
  count = "#{params[:count]}"
  redis.HMSET(account_id, "volumes", count) 
end






get '/:account_id/servers/count' do
  redis = Redis.new
  account_id = "#{params[:account_id]}"
  redis.HGET(account_id, "servers")
end


get '/:account_id/loadBalancers/count' do
  redis = Redis.new
  account_id = "#{params[:account_id]}"
  redis.HGET(account_id, "loadBalancers")
end


get '/:account_id/bigDataClusters/count' do
  redis = Redis.new
  account_id = "#{params[:account_id]}"
  redis.HGET(account_id, "bigDataClusters")
end


get '/:account_id/dataBases/count' do
  redis = Redis.new
  account_id = "#{params[:account_id]}"
  redis.HGET(account_id, "dataBases")
end


get '/:account_id/volumes/count' do
  redis = Redis.new
  account_id = "#{params[:account_id]}"
  redis.HGET(account_id, "volumes")
end

