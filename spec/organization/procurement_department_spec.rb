require 'spec_helper'

describe Organization::ProcurementDepartment  do
	context "Initialize" do
		it "the Procurement Department with name t-shirts, cash 50000 and inventory 4000 should return 50000 cash" do
			 t_shirts_department = build(:procurment_department) 
			expect(t_shirts_department.cash).to eq(50000)
		end
	end

  context "Inventory" do
    it "the Procurement Department with inventory 4000 should return average_inventory 4000" do
       t_shirts_department = build(:procurment_department, inventory:4000) 
      expect(t_shirts_department.average_inventory).to eq(4000)
    end
    it "the Procurement Department with inventory 4000 and category black should return average_inventory 4000" do
       t_shirts_department = build(:procurment_department, inventory:4000 , category:{color: "black"}) 
      expect(t_shirts_department.total_inventory_by_category({color: "black"})).to eq(4000)
    end
    it "the Procurement Department with inventory 4000 and category black should return average_inventory 4000" do
       t_shirts_department = build(:procurment_department, inventory:4000 , category:{color: "blue"}) 
      expect(t_shirts_department.total_inventory_by_category({color: "black"})).to eq(0)
    end
    it "the Procurement Department with inventory 4000 and category black should return average_inventory 4000" do
       t_shirts_department = build(:procurment_department, inventory:4000 , category:{color: "black", garment_subtype: "shirt"}) 
      expect(t_shirts_department.inventory_by_category_excuding_other_category(["tshirt","jeans"])).to eq(4000)
    end
  end

end