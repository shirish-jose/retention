module ApplicationHelper

  # @param  [Array<Category>]
  # @return [String]
  def categories_label(categories)
    categories.map(&:name).join(' / ') if categories.present?
  end
end
