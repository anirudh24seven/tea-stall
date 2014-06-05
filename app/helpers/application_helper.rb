module ApplicationHelper
  def site_name
    "Tea Stall"
  end

  def site_url
    if Rails.env.production?
      "http://tea-stall.heroku.com"
    else
      "http://localhost:3000"
    end
  end

  def meta_author
    "Anirudh S"
  end

  def meta_description
    "Tea Stall is news source that your team needs"
  end

  def meta_keywords
    "team"
  end

  def full_title(page_title)
    if page_title.empty?
      site_name
    else
      "#{page_title} | #{site_name}"
    end
  end

  def authenticator
    @authenticator ||= Koala::Facebook::OAuth.new(ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_SECRET"], url("/auth/facebook/callback"))
  end

end
