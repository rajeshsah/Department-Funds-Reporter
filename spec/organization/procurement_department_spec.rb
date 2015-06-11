require 'spec_helper'

describe Organization::ProcurementDepartment  do
	context "Initialize" do
		it "the Procurement Department with name t-shirts, cash 50000 and inventory 4000 should return 50000 cash" do
			 t_shirts_department = build (:procurment_department) 
			expect(t_shirts_department.cash).to eq(50000)
		end
	end
end