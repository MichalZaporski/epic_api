class CategoriesRepresenter
  def initialize(categories)
    @categories = categories
  end

  def remove_unnecessary_data
    @categories.map do |category|
      {
        id: category.id,
        category_name: category.category_name
      }
    end
  end
end
