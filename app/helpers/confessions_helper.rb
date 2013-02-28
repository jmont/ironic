module ConfessionsHelper
  def view_cookie(id)
    name = 'confession' + id.to_s()
    if !cookies[:name].present? or cookies[:name] == "0"
      cookies[:name] = 0
      "Flag" + cookies[:name] + name
    else
      "Unflag" + cookies[:name] + name
    end
  end
end
