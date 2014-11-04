require "spec_helper"

describe Tilt::FlatironTemplate do

  it "can register to tilt" do
    template = Tilt::FlatironTemplate.new('spec/fixtures/simple.flat')
    output = template.render()
    expect(output).to_not be_empty
    expect(output).to be_kind_of String
    expect(output).to eq("<html><body></body></html>")
  end

  it "can render local variables" do
   template = Tilt::FlatironTemplate.new('spec/fixtures/variables.flat')

   output = template.render(Object.new, { the_var: "this is a var"})
   expect(output).to eq("<html>this is a var</html>")
  end

  it "can render instance variables" do
   template = Tilt::FlatironTemplate.new('spec/fixtures/instance_variables.flat') 
   @instance_var = "A message that should be displayed in the template"
   output = template.render(self)
   expect(output).to eq("<html>A message that should be displayed in the template</html>")
  end

  it "can render complex templates" do
    @students = []
    1.upto(2) do |num|
        @students << Student.new.tap do |student|
          student.name = "Student#{num}"
          student.age = 30
          student.city = "New York"
        end
    end    
    template = Tilt::FlatironTemplate.new('spec/fixtures/complex.flat') 
    output = template.render(self)
    expect(output).to eq("<html><body><p>30</p><p>30</p></body></html>")
  end

end

class Student
  attr_accessor :name, :age, :city
end