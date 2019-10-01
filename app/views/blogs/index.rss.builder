xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "The Stay Sane Mom"
    xml.description "Tools and support for the marker-stained, under-slept, soul-hungry mom."
    xml.link root_url

    @published_blogs.each do |blog|
      xml.item do
        xml.title blog.title
        xml.author blog.user.email
        xml.description blog.body
        xml.pubDate blog.published_on.to_s(:rfc822)
        xml.link blog_url(blog)
        xml.guid blog_url(blog)
      end
    end
  end
end
