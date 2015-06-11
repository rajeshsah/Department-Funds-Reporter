
FactoryGirl.define do 
	factory :procurment_department, :class => Organization::ProcurementDepartment do
		name "Default"
		cash 50000
		inventory 500
		category "Default"
		initialize_with { new( name, cash, inventory, category ) }
	end

	factory :managerial_department, :class => Organization::ManagerialDepartment do
	  name  "Finance"
    sub_departments []
    category "Default"
		initialize_with { new( name, sub_departments , category) }
	end

	factory :department, :class => Organization::Department do
	  name  "Finance"
    category "Default"
		initialize_with { new( name, category) }
	end
end