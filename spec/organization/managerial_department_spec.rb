require "spec_helper"

describe Organization::ManagerialDepartment do
 
  context 'Get total funds' do
  	it "should return total funds of a Department as a sum of funds in each of it's sub departments" do
  		sub_department1 = build(:procurment_department, cash: 50000)
  		sub_department2 = build(:procurment_department, cash: 50000)
  		sub_department3 = build(:procurment_department, cash: 50000)
  		department = build(:managerial_department, sub_departments: [sub_department1, sub_department2, sub_department3])
  		expect(department.cash).to eq(150000.0)
  	end	

  	it "should return total funds of a Department as a sum of funds in each of it's sub departments" do
  		sub_department1 = build(:procurment_department, cash: 50000)
      sub_department2 = build(:procurment_department, cash: 50000)
      sub_department3 = build(:procurment_department, cash: 50000)
      department = build(:managerial_department)
      department2 = build(:managerial_department, sub_departments: [sub_department1, sub_department2, sub_department3, department])
  		expect(department2.cash).to eq(150000.0)
  	end	

    it "should return total inventory of a Department as a sum of inventory in each of it's sub departments" do
     sub_department1 = build(:procurment_department, inventory: 500)
      sub_department2 = build(:procurment_department, inventory: 500)
      sub_department3 = build(:procurment_department, inventory: 500)
      department = build(:managerial_department, sub_departments: [sub_department1, sub_department2, sub_department3])
      expect(department.inventory).to eq(1500.0)
    end 
  end   
end