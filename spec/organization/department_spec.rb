require 'spec_helper'

describe Organization::Department  do
  context "Initialize" do
    it "the Procurement Department with category Shirt" do
       t_shirts_department = build(:department, category: "Jeans") 
      expect(t_shirts_department.category).to eq("Jeans")
    end
  end
end