# encoding:utf-8 


require 'twitter'
require 'pp'


client = Twitter::REST::Client.new do |config|
  config.consumer_key = "n8lzdx8JT35WGZVQBLEenTwKB"
  config.consumer_secret = "B13zyBO6WfPXbtXNN0xB6kzk1bb3OQsdCm4IILe8t94e7UFPhm"
  config.access_token = "3183045949-rlOlM5U8eFUEtYN119VjgeXiXIGkB5CoVQQyqZt"
  config.access_token_secret = "bide0y9arSvnYJqaoU7rhSBmcPpeU8UC0e0rDevZVHTyg"
end

followers_list = client.friends("ryukyudai_tarou")
                
                        
number = 1              
count = 1                       
rand = rand(500)                
#followできるかを判断するメソッド
define_method(:can_follow?) do |match,out,user,description|
        match = Regexp.new(match)       
        out   = Regexp.new(out)                 
        return  match =~ description && !( out =~ description) && user.follow_request_sent? == false && client.block?(user.id) == false
end                             
                        
catch(:out) do
        followers_list.each do |x|
                count = count + 1
                        followers_list_list = client.friends(x)
                        followers_list_list.each do |i|
                                description = i.description
                                if can_follow?("琉球大学","TOEIC",i,description) then
                                client.follow(i)
                                number = number + 1
                                        if number == 100 then
                                                throw :out
                                        end
                                end
                        end
        end 
end

