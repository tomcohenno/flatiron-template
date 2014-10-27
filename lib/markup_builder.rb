# require 'pry'
class MarkupBuilder

  def initialize
    @markup = ""
  end

  def method_missing(tag_name, *arguments, &block)
    puts "#{tag_name}, #{arguments}"
    @markup << "<#{tag_name}>"
    
    self.instance_eval(&block) if block
    
    @markup << "</#{tag_name}>"

    self
  end

  def build
    @markup
  end
 
end