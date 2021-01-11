require 'open-uri'
require 'nkf'

url = "https://www.superdelivery.com/p/r/pd_p/6310335/"
filename = "soldout_test.html"

File.open(filename, "w") do |f|
    text = URI.open(url).read
    f.write text
end