module ApplicationHelper
  def clickable_pretty_feed_url(url, id)
    link_to url.sub(/^https?\:\/\//, '').sub(/^www./,''), feed_path(id)
  end
  
  def pretty_feed_url(url)
    url.sub(/^https?\:\/\//, '').sub(/^www./,'')
  end
end
