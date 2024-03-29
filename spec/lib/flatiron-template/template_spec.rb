require "spec_helper"

describe Flatiron::Template do

  let(:builder) { Flatiron::Template.new }

  context "when building markup documents" do

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

      it "can render sibiling tags" do
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

      it "can render preformatted content" do
        builder.html {
          """
          Hello
          World
          From 
          here
          """
        }

        expect(builder.build).to eq("""<html>
          Hello
          World
          From 
          here
          </html>""")
      end

      it "can render Fixnum as content" do
        builder.html {
          6
        }
        expect(builder.build).to eq("<html>6</html>")
      end

      it "can render boolean as content" do
        builder.html {
          pp true
          p {
            false
          }
        }
        expect(builder.build).to eq("<html>true<p>false</p></html>")
      end      

      context "when rendering multiple textual content inside a tag" do

        it "should use the pp method" do
          fruits = ["Apple", "Banana", "Orange", "Pineapple"] 
          builder.html {
            fruits.each do |fruit|
              pp fruit
            end
          }
          expect(builder.build).to eq("<html>AppleBananaOrangePineapple</html>")
        end

        it "renders properly when used in isolation" do
          builder.html {
              pp "not_repeated"
          }

          expect(builder.build).to eq("<html>not_repeated</html>")
        end

        it "renders properly when numbers are supplied" do
          builder.html {
            pp 9999
          }
          expect(builder.build).to eq("<html>9999</html>")
        end
      end

      it "can run ruby code between blocks" do
        builder.html {
          5.times.collect { "Hey" }.join(",  ")
        }
        expect(builder.build).to eq("<html>Hey,  Hey,  Hey,  Hey,  Hey</html>")
      end


      context "when rendering tags that clash with ruby keywords" do
        context  "when rendering the p tag" do
          it "allows the p tag to be rendered" do
            builder.html {
              p {

              }
            }
            expect(builder.build).to eq("<html><p></p></html>")
          end

          it "allows the p tag to have attributes" do
            builder.html {
              p(test:'true') {

              }
            }            

            expect(builder.build).to eq("<html><p test=\"true\"></p></html>")
          end

          it "allows the p tag to have content and attributes" do
            builder.html {
              p(test:'true') {
                "Yo!"
              }
            }            

            expect(builder.build).to eq("<html><p test=\"true\">Yo!</p></html>")            
          end

        end

        it "it allows setting class as attribute" do

          builder.html {
            p(class: 'test') {

            }
          }

          expect(builder.build).to eq('<html><p class="test"></p></html>')
        end

        it "can render variables" do
          cake = true
          builder.html {
            cake
          }
          expect(builder.build).to eq("<html>true</html>")
        end 

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

    context "when rendering html specific tags" do

      it "can render script tags" do 
        builder.html {
          script {
            "alert('test')"
          }
        }

        expect(builder.build).to eq("<html><script>alert('test')</script></html>")
      end

      it "can render style tags" do
        builder.html {
          style {
            "body { color:blue }"
          }
        }

        expect(builder.build).to eq("<html><style>body { color:blue }</style></html>")        
      end

    end

  end

  describe "#build" do
    it "returns a string" do
      expect(builder.build).to be_a(String)
    end

    it "can render a complex html" do

      builder.
      html {
        head {
          title {
            "A webpage"
          }
        }
        body {
          h1 { "Hello World!" }
          form(action: "/test", method:"post") {
            input(type: "text", value: "test")
            input(type: "submit", value: "Save it")
          }
        }
      }
      expect(builder.build).to eq("<html><head><title>A webpage</title></head><body><h1>Hello World!</h1><form action=\"/test\" method=\"post\"><input type=\"text\" value=\"test\"></input><input type=\"submit\" value=\"Save it\"></input></form></body></html>")
    end

  end

  
end