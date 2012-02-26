# -*- encoding: utf-8 -*-
require 'twitter'
require 'pp'
require 'igo-ruby'

Twitter.configure do |config|
    config.consumer_key = ''
    config.consumer_secret = ''
    config.oauth_token = ''
    config.oauth_token_secret = ''
end

lastId = ""
counts = Hash.new
mapTweetsAndId = Hash.new
@rescure

(1...15).each do |i|
    res = Twitter.search("#めんどくさいｰ1グランプリ", {:rpp=>100, :page=>i})
    res.each do |tweet|
        # 念のため
        text = tweet.text.gsub(/RT\s@.*?:\s/,"")
        text.gsub!(/#めんどくさいｰ1グランプリ/,"")
        lastId = tweet[:id]
        counts.store(text.to_s, 0) if(!counts.has_key? text.to_s)
        counts[text] = counts[text].to_i + 1
        
        #TwitterにアクセスするとAPIが消費されるのでメモリに保存
        mapTweetsAndId.store(text, text)
    end
    if res.count < 99
        break
    elsif
        p lastId
    end
end

counts.sort{|a,b| b[0].to_s<=>a[1].to_s}.each do |k, v|
    puts mapTweetsAndId[k.to_s].to_s + "  :  " + v.to_s + "回RT" if (v.to_i > 2)
    
end
