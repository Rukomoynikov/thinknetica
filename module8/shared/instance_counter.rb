module InstanceCounter

  def self.included (base)
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  module ClassMethods
    attr_accessor :instances_count

    def increase_instances 
      self.instances_count = self.instances_count.nil? ? 1 : self.instances_count + 1
    end
  end

  module InstanceMethods

    private 

    def register_instance
      self.class.increase_instances
    end
  end
end