#Represents an operational division in an organization 
class Organization::ProcurementDepartment
	attr_reader :cash, :inventory
	def initialize(name, funds, inventory_count)
		@name = name
		@cash = funds
		@inventory	= inventory_count
	end
end