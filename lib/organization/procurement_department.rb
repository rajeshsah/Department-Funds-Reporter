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

  def total_inventory_by_category(category)
    return inventory if @category == category
    return 0
  end
end