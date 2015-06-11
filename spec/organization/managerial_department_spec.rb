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
  end

  context 'Get inventory' do
    it "should return total inventory of a Department as a sum of inventory in each of it's sub departments" do
     sub_department1 = build(:procurment_department, inventory: 500)
      sub_department2 = build(:procurment_department, inventory: 500)
      sub_department3 = build(:procurment_department, inventory: 500)
      department = build(:managerial_department, sub_departments: [sub_department1, sub_department2, sub_department3])
      expect(department.inventory).to eq(1500.0)
    end

    it "should return average inventory for its sub departments" do
      sub_department1 = build(:procurment_department, inventory: 500)
      sub_department2 = build(:procurment_department, inventory: 500)
      sub_department3 = build(:procurment_department, inventory: 500)
      department = build(:managerial_department, sub_departments: [sub_department1, sub_department2, sub_department3])
      expect(department.average_inventory).to eq(500.0)
    end 

    it "should return sum of inventory for black category" do
      sub_department1 = build(:procurment_department, inventory: 500, category:{color: "blue"})
      sub_department2 = build(:procurment_department, inventory: 500, category:{color: "black"})
      sub_department3 = build(:procurment_department, inventory: 600, category:{color: "black"})
      department = build(:managerial_department, sub_departments: [sub_department1, sub_department2, sub_department3])
      expect(department.total_inventory_by_category({color: "black"})).to eq(1100)
    end

    it "should return sum of inventory for black category for multi level" do
      sub_department1 = build(:procurment_department, inventory: 500, category:{color: "blue"})
      sub_department2 = build(:procurment_department, inventory: 500, category:{color: "black"})
      sub_department3 = build(:procurment_department, inventory: 600, category:{color: "black"})
      department1 = build(:managerial_department, sub_departments: [sub_department1, sub_department2, sub_department3])
      sub_department4 = build(:procurment_department, inventory: 700, category:{color: "black"})
      department2 = build(:managerial_department, sub_departments: [sub_department4])
      department = build(:managerial_department, sub_departments: [department1, department2])
      expect(department.total_inventory_by_category({color: "black"})).to eq(1800)
    end
    
    it "should return sum of inventory for black but not tshirt or jeans category for multi level" do
      sub_department1 = build(:procurment_department, inventory: 500, category:{color: "black", garment_subtype: "shirt"})
      sub_department2 = build(:procurment_department, inventory: 300, category:{color: "black", garment_subtype: "tshirt"})
      sub_department3 = build(:procurment_department, inventory: 600, category:{color: "black", garment_subtype: "jeans"})
      department1 = build(:managerial_department, sub_departments: [sub_department1, sub_department2, sub_department3])
      sub_department4 = build(:procurment_department, inventory: 700, category:{color: "black", garment_subtype: "trousers"})
      department2 = build(:managerial_department, sub_departments: [sub_department4])
      department = build(:managerial_department, sub_departments: [department1, department2])
      expect(department.inventory_by_category_excuding_other_category(["tshirt","jeans"])).to eq(1200)
    end
  end  

end