module ApplicationHelper

  def has_asset?(path)
    Rails.application.assets.find_asset(path) != nil
  end
end
