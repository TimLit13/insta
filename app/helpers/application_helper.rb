module ApplicationHelper
  def bootstrap_class_for(name)
    {
      success: "alert-success",
      error: "alert-danger",
      danger: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }[name.to_sym] || name
  end

  def avatar_url user
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://www.gravatar.com/avatar/#{gravatar_id}.jpg"
  end
end
