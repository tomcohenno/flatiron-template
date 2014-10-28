Markup Builder
===


A simple ruby-based markup builder 

```ruby
html {
  head {

  }
}

method_missing(a_tag_name, its_attributes, block_of_code)

builder.html ==> method_missing("html", nil, { head })

yield with self being builder {
  head
}

head => method_missing("head", nil, nil)

```