Flatiron Template
===


A simple PoC of ruby-based markup builder. Build markup text using a Ruby based DSL!

Usage:
---

Add the gem to your Gemfile:

```ruby
gem 'flatiron-template', :git => 'git@github.com:fkenji/flatiron-template.git'
```

And then install it with bundle:

```bash
bundle install
```

After that, use Bundler's require:

```ruby
require 'bundler/setup'
Bundler.require

builder = Flatiron::Template.new

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

builder.build 
```

The output should be:

```html
<html><head><title>A webpage</title></head><body>
  <h1>Hello World!</h1><form action="/test"><input type="text" value="test"><input type="submit" value="Save it"></form>
</body></html>
```


Sinatra integration
---

In order to use this builder with Sinatra, this needs to be added to your Gemfile instead:

```ruby
gem 'flatiron-template', :git => 'git@github.com:fkenji/flatiron-template.git', :require => 'flatiron-template/register_for_sinatra'
```

By requiring this gem, you can now render templates by calling the flat method inside a Sinatra controller:

```ruby
  get '/archives' do 
    flat :"/views/archives" #renders the template at /views/archives.flat
  end
```

A sample project can be found <a href="https://github.com/fkenji/sinatra-flatiron-template">here</a>.

Template Files
---
The extension for flatiron templates are **.flat** files (i.e: index.flat, show.flat) .
