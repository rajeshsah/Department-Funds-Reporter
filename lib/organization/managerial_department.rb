# Represents an administrative division in an organization
class Organization::ManagerialDepartment < Organization::Department
	
	def initialize(name, sub_departments = [], category)
		super(name, category)
		@sub_departments = sub_departments
	end

	def cash
		@sub_departments.inject(0) do |sum, dept| 
			sum + dept.cash 
		end
	end

	def inventory
		@sub_departments.inject(0) do |sum, dept| 
			sum + dept.inventory
		end
	end

	def average_inventory
		inventory/@sub_departments.length
	end
end