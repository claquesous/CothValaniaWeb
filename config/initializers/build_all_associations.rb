class AssociationError < RuntimeError
end

class ActiveRecord::Base
  private
    def method_missing(method, *args, &block)
      if method =~ /build_all_(.*)/
        association = $1.to_sym
        # Validate that self indeed contains the implied association
        unless self.class.reflect_on_association(association)
          raise AssociationError, "Association `#{association}' does not exist in class #{self.class}"
        end
	# Define method for later calls
	class_eval %Q{
          def build_all_#{association}(list)
            build_all_association(:#{association}, list)
	  end
	}
        self.send %Q{build_all_#{association}}, *args, &block 
      else
        super
      end
    end

    def build_all_association(association_sym, list)
      association = send association_sym
      # Validate that the argument contains the implied association
      case list
      when Array, ActiveRecord::Relation
        list.each_with_index do |associated, idx|
          unless reflection = associated.class.reflect_on_association(association_sym)
            raise AssociationError, "Association `#{association_sym}' does not exist in class #{associated.class}"
          end          
          unless index = association.find_index{|f| eval("f.#{associated.class.table_name.singularize}") == associated}
            association.build(reflection.foreign_key => associated.id)
            index = -1
          end
          association.insert(idx, association.delete_at(index))
        end
      else
        raise TypeError, "Expected #{Array.to_s} or #{ActiveRecord::Relation.to_s} got #{list.class}"
      end
    end
end
