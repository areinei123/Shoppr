class GuestUser
  def in_group?(*)
    false
  end

  def authenticated?
    false
  end
end
