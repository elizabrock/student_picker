require 'rails_helper'

RSpec.describe Student, :type => :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  context ".pick!" do
    it "should choose the student via. sample" do
      a = Fabricate(:student, name: "A")
      b = Fabricate(:student, name: "B")
      c = Fabricate(:student, name: "C")
      d = Fabricate(:student, name: "D")
      randomish_order = [a, b, d, c]
      Array.any_instance.stub(:sample) do |array|
        randomish_order.shift
      end
      Student.pick!.should == a
      Student.pick!.should == b
      Student.pick!.should == d
      Student.pick!.should == c
    end
  end
end
