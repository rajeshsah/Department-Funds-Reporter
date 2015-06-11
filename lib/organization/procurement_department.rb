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
end