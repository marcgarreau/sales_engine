module Finder
  def all
    self.items
  end

  def random
    self.items.sample
  end

  def self.included(base)
    base.send(:extend, ClassMethods)
  end

  module ClassMethods
    def define_finders(*method_names)
      method_names.each do |method_name|
        define_method("find_by_#{method_name}") do |arg|
          items.find { |item| item.public_send(method_name) == arg }
        end

        define_method("find_all_by_#{method_name}") do |arg|
          items.find_all { |item| item.public_send(method_name) == arg }
        end
      end
    end
  end
end
