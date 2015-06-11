# Represents base class for all the departments as combination of name-category
class Organization::Department
  
  attr_reader :category
  def initialize(name, category)
    @name = name
    @category = category
  end
  def total_inventory_by_category(category)
  end
end