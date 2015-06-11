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

	 def total_inventory_by_color(color)
    @sub_departments.inject(0) do |sum, dept| 
			sum + dept.total_inventory_by_color(color)
		end
  end

  def inventory_of_black_clothes_excuding_tshirt_and_jeans
  	@sub_departments.inject(0) do |sum, dept| 
			sum + dept.inventory_of_black_clothes_excuding_tshirt_and_jeans
		end
  end

end