Markup Builder
===


A simple ruby-based markup builder 

Usage:
---

```ruby
builder = MarkupBuilder.new

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

builder.build #outputs generated markup

builder.to_file #generates tmp/markup.html

```