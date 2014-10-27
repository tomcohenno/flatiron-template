require "spec_helper"

describe MarkupBuilder do

  let(:builder) { MarkupBuilder.new }


# builder = MarkupBuilder.new

# builder.html {
#   input(type: 'text') {
#     puts "da block"
#   }
# }

# puts builder.html {
#   input(type: 'text'){

#   }
# } . build

  context "when building html" do

    it "can respond to tag names as method calls" do
      expect{ builder.html }.not_to raise_error
      expect{ builder.input }.not_to raise_error
      expect{ builder.td }.not_to raise_error
      expect{ builder.form }.not_to raise_error
    end


    context "when creating tags" do
      it "can create a root tag" do
        expect(builder.html.build).to eq("<html></html>")
      end    

      it "can create nested tags" do
        builder.
          html {
            head {

            }
          }
          expect(builder.build).to eq("<html><head></head></html>")
      end

      it "can create several nested tags" do
        expect(builder.html { head { title { } }}.build).to eq("<html><head><title></title></head></html>")
      end

    end

  end

  describe "#build" do
    it "returns a string" do
      expect(builder.build).to be_a(String)
    end


  end

  # it "creates simple markup" do
  # end
  
end