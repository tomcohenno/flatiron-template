class MarkupBuilder

  def initialize
    @markup = String.new
  end

  def method_missing(tag_name, *element_attributes, &block)

    start_markup(tag_name, element_attributes.first)
    
    if block
      returned_value = self.instance_eval(&block) 
      if returned_value.is_a? String
        @markup << returned_value if returned_value
      end
    end
    
    end_markup(tag_name)    

    return self
  end

  def build
    @markup
  end
 
  private
  def start_markup(tag_name, attributes)
    @markup << "<#{tag_name}"
    if attributes
      attributes.each do |attribute_name, attribute_value|
        @markup << " #{attribute_name.to_s}=\"#{attribute_value}\""
      end
    end    
    @markup << ">"
  end

  def end_markup(tag_name)
    @markup << "</#{tag_name}>"
  end
end