class Guest
  include Singleton
  def first_name
    "Guest"
  end
  
  def last_name
    ""
  end

  def logged_in?
    false
  end
end