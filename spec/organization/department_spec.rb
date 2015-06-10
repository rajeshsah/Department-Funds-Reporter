require "spec_helper"

describe Organization::Department do
  context 'Equality' do
  	it "should be equal to itself" do
  		department1 = Organization::Department.new("Finance", 10000)
  		expect(department1).to eq(department1)
  	end

  	it "should be equal to another Department object with same name and cash" do
  		department1 = Organization::Department.new("Finance", 10000)
  		department2 = Organization::Department.new("Finance", 10000)
  		expect(department1).to eq(department2)
  	end

  	it "should be equal to another Department object with same name, cash and sub_departments" do  		
  		sub_department1 = Organization::Department.new("Finance_Delhi", 10000)
  		sub_department2 = Organization::Department.new("Finance_Indore", 10000)
  		sub_department3 = Organization::Department.new("Finance_Mumbai", 10000)
  		department1 = Organization::Department.new("Finance", [sub_department1, sub_department2, sub_department3])
  		department2 = Organization::Department.new("Finance", [sub_department1, sub_department2, sub_department3])
  		expect(department1).to eq(department2)
  	end

  	it "should not be equal to another Department object with different name and cash" do
  		department1 = Organization::Department.new("Finance", 10000)
  		department2 = Organization::Department.new("Engineering", 10001)
  		expect(department1).to_not eq(department2)
  	end

  	it "should not be equal to nil" do
  		department1 = Organization::Department.new("Finance", 10000)
  		department2 = nil
  		expect(department1).to_not eq(department2)
  	end
  end


  context 'Get total funds' do
  	it "should return total funds of a Department as a sum of funds in each of it's sub departments" do
  		sub_department1 = Organization::Department.new("Finance_Delhi", 10000)
  		sub_department2 = Organization::Department.new("Finance_Indore", 10000)
  		sub_department3 = Organization::Department.new("Finance_Mumbai", 10000)
  		department = Organization::Department.new("Finance",0, [sub_department1, sub_department2, sub_department3])
  		expect(department.get_cash).to eq(30000.0)
  	end
  	
  end
  context 'Hash' do
  	it "should have the same hash with another object with same name and cash" do
  		department1 = Organization::Department.new("Finance", 10000)
  		department2 = Organization::Department.new("Finance", 10000)
  		expect(department1.hash).to eq(department2.hash)
  	end
  end

end