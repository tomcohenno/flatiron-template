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

   puts output
   expect(output).to_not be_empty
  end

end