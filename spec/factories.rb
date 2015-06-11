
FactoryGirl.define do 
	factory :procurment_department, :class => Organization::ProcurementDepartment do |f| 
		f.name "Default"
		f.cash 50000
		f.inventory 500
		initialize_with { new( name, cash, inventory ) }
	end

	factory :managerial_department, :class => Organization::ManagerialDepartment do
	  name  "Finance"
    sub_departments []
		initialize_with { new( name, sub_departments ) }
	end
end