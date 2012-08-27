module ApplicationHelper
  def active_nav_link(link)
    content_for(:active_nav_link) do
      link
    end
  end
end
