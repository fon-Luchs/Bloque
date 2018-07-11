module ApplicationHelper

  def current_path?(page_path)
    true if request.path == page_path
  end

end
