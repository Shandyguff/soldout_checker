htmlfile = "soldout_test.html"
textfile = "soldout_cut.html"

html = File.read(htmlfile)

File.open(textfile, "w") do |f|
    in_header = true
    html.each_line do |line|
        if in_header && /<div class="product-information-box pre-set">/ !~ line
            next
        else
            in_header = false
        end
        break if /<div class="prodact-detail-action-box btm-fix-btns" style="text-align: right;">/ =~ line
        line.gsub!(/\s*/, '')
        f.write line
    end
end
