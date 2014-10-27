require "spec_helper"

describe MarkupBuilder do

  let(:builder) { MarkupBuilder.new }

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

      it "can render tags in the same level" do
        builder.html {
          head {

          }
          body {

          }
        }

        expect(builder.build).to eq("<html><head></head><body></body></html>")
      end
    end

    context "when setting content between tags" do
      it "can render content passed between blocks" do
        builder.html {
          head {
            "This is a content for HEAD"
          }
          body {
            "This is a content for BODY"
          }
        }

        expect(builder.build).to eq("<html><head>This is a content for HEAD</head><body>This is a content for BODY</body></html>")
      end
    end

    context "when setting attributes" do

      it "supports a single attribute" do

          builder.input(type: "text") {

          }

          expect(builder.build).to eq('<input type="text"></input>')
      end

      it "supports multiple attributes" do
          builder.input(type: "text", value: "something here", id: "some_id") {

          }

          expect(builder.build).to eq('<input type="text" value="something here" id="some_id"></input>')
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