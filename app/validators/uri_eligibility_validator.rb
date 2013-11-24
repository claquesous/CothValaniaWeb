class UriEligibilityValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ /^[#_'0-9a-zA-Z \+\-]+$/
      object.errors[attribute] << "can not contain special characters"
    end
  end
end
