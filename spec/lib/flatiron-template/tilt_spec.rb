require "spec_helper"

describe Tilt::FlatironTemplate do

  it "can register to tilt" do
    template = Tilt::FlatironTemplate.new('spec/fixtures/sample.flat')
    output = template.render()
    expect(output).to_not be_empty
    expect(output).to be_kind_of String
  end

end