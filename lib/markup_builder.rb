class MarkupBuilder

  def initialize
    @markup = ""
  end

  def method_missing(tag_name, *tag_attributes, &block)

    @markup << "<#{tag_name}"

    if !tag_attributes.empty?
      tag_attributes.first.each do |attribute_name, attribute_value|
        @markup << " #{attribute_name.to_s}=\"#{attribute_value}\""
      end
    end
    @markup << ">"
    
    if block
      returned_value = self.instance_eval(&block) 
      if returned_value.is_a? String
        @markup << returned_value if returned_value
      end
    end
    
    @markup << "</#{tag_name}>"

    self
  end

  def build
    @markup
  end
 
end