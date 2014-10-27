# require 'pry'
class MarkupBuilder

  def initialize
    @markup = ""
  end

  def method_missing(method_sym, *arguments, &block)
    @markup << "#{method_sym} \n"
    
    self.instance_eval(&block) if block

    self
  end

  def build
    @markup
  end

  def open_tag(tag)
    "<#{tag}>"
  end

  def close_tag(tag)
  end
end


builder = MarkupBuilder.new

# builder.html {
#   input(type: 'text') {
#     puts "da block"
#   }
# }

puts builder.html {
  input(type: 'text'){

  }
} . build