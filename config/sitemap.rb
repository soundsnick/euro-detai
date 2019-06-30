host "xn----8sbejcd7btry6i.xn--p1ai"

sitemap :site do
  url root_url, last_mod: Time.now, change_freq: "daily", priority: 1.0
  url parts_url
  url news_url
  Part.all.each do |post|
    url post
  end
  New.all.each do |post|
    url new_url(post.id)
  end
end

ping_with "http://#{host}/sitemap.xml"