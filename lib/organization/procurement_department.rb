#Represents an operational division in an organization 
class Organization::ProcurementDepartment < Organization::Department
	attr_reader :cash, :inventory
	def initialize(name, funds, inventory_count ,category)
    super(name, category)
		@cash = funds
		@inventory	= inventory_count
	end

  def average_inventory
    @inventory
  end

  def total_inventory_by_black(category)
    return inventory if @category[:color] == "black"
    return 0
  end

  def inventory_by_black_excuding_other_category(category_excluded)

    excluded_array = category_excluded[:garment_subtype]
    return 0 if excluded_array && excluded_array.include?(@category[:garment_subtype])
    if @category[:color] == "black" 
      return inventory 
    end
    return 0
  end
end