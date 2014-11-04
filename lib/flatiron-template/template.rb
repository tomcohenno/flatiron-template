module Flatiron
  class Template

    @@allowed_types_as_content = [String, Fixnum, TrueClass, FalseClass]

    def initialize
      @markup = String.new
    end

    def method_missing(tag_name, *element_attributes, &block)
      start_markup(tag_name, element_attributes.first)
      
      if block
        returned_value = self.instance_eval(&block) 
        if returned_value && @@allowed_types_as_content.include?(returned_value.class)
          @markup << returned_value.to_s
        end
      end
      
      end_markup(tag_name)    

      return self
    end

    def build
      @markup
    end

    def pp(content)
      @markup << content
      nil
    end

    def render(scope, data, locals={})
      the_binding = binding()

      locals.each do |k, v|
        the_binding.local_variable_set(k.to_sym, v)
      end

      if scope
        scope.instance_variables.each do |name|
          value = scope.instance_variable_get(name)
          self.instance_variable_set(name, value) if value
        end
      end

      eval(data, the_binding)
    end

    def to_file(file_path="tmp/markup.html") 
      File.write(file_path, @markup)
    end

    def to_ary
      [self.to_s]
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
end