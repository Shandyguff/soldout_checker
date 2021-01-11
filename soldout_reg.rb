require 'open-uri'

htmlfile = "soldout_cut.html"
html = File.read(htmlfile)
soldout_is = false

num = []
i = 0

m = /detail"><div>(?<p_name>[^<]+)<[^>]+>(?<p_code>[^<]+)<[^>]+><[^>]+>([^<]+)<[^>]+><[^>]+><[^>]+><[^>]+><[^>]+>([^<]+)<[^>]+><[^>]+><[^>]+><[^>]+>[^<]+<[^>]+><[^>]+>[^<]+<[^>]+><[^>]+><[^>]+><[^>]+><[^>]+><[^>]+>(?<remain>[^<]+)/.match(html)
html.scan(/detail"><div>(?<p_name>[^<]+)<[^>]+>(?<p_code>[^<]+)<[^>]+><[^>]+>([^<]+)<[^>]+><[^>]+><[^>]+><[^>]+><[^>]+>([^<]+)<[^>]+><[^>]+><[^>]+><[^>]+>[^<]+<[^>]+><[^>]+>[^<]+<[^>]+><[^>]+><[^>]+><[^>]+><[^>]+><[^>]+>(?<remain>[^<]+)/) do |matched|
  matched.each do |ary|
    num << ary
    num.uniq!
  end
  p num[0][1]
end


#if m[:remain] == "SOLD&nbsp;OUT"
#    soldout_is = true
#    puts "#{m[:p_name]}の在庫がなくなりました(Alart!!!)。"
#else
#    soldout_is = false
#    puts "#{m[:p_name]} の在庫はまだあります。"
#end