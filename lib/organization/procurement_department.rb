#Represents an operational division in an organization 
class Organization::ProcurementDepartment
	attr_reader :cash, :inventory_count
	def initialize(name, funds, inventory_count)
		@name = name
		@cash = funds
		@inventory_count	= inventory_count
	end
end