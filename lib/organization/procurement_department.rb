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

  def total_inventory_by_color(color)
    return inventory if @category[:color] == color
    return 0
  end

  def inventory_of_black_clothes_excuding_tshirt_and_jeans
    return 0 if ["tshirt","jeans"].include?(@category[:garment_subtype])
    if @category[:color] == "black" 
      return inventory 
    end
    return 0
  end
end