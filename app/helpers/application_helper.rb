module ApplicationHelper
  def active_controller?(controller_name)
    params[:controller] == controller_name ? 'active' : nil
  end
end
