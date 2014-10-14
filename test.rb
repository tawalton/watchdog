require 'redis'

redis = Redis.new

redis.set("foo", "bar")
output = redis.get "foo"
puts output
#redis.RPUSH name tommy
#redis.RPUSH name walton

#file = File.open('names').read
#   file.each_line do |name|
#       puts name
#    end
