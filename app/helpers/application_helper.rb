module ApplicationHelper

  def get_categories
    Category.all.limit(9)
  end

end
