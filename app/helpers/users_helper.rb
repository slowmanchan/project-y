module UsersHelper

  # Returns gravatar for user
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    default_image = 'retro'
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=#{default_image}&s=#{size}"
    image_tag(gravatar_url, alt: user.email, class: "gravatar")
  end
end
