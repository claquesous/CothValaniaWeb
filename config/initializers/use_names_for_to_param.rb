class ActiveRecord::Base
  def to_param
    has_attribute?(:name) ? CGI.escape(name) : super
  end
end
