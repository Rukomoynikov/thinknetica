module Acessors
  def attr_accessor_with_history (*names)
    names.each do |name|
      var_name = "@#{name}".to_sym

      define_method(name) { instance_variable_get(var_name) } #@a

      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}_with_history", []) unless instance_variable_get("@#{name}_with_history") # @#{name}_with_history = []
        
        instance_variable_get("@#{name}_with_history") <<  instance_variable_get(var_name)
        instance_variable_set(var_name, value)

      end
      
      define_method("#{name}_with_history") { instance_variable_get("@#{name}_with_history") }
      

    end
  end
end