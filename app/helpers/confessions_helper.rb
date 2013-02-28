module ConfessionsHelper
  def view_cookie(id)
    name = 'confession' + id.to_s()
    if !cookies[name].present? or cookies[name] == "0"
      cookies[name] = "0"
      return "Flag"
    else
      return "Unflag"
    end
  end
end
