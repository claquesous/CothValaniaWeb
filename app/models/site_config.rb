class SiteConfig < ActiveRecord::Base
  attr_accessible :description, :password, :password_confirmation, :site_name, :members, :events, :rewards, :occurrences, :jobs, :requirements, :config_comment, :races, :dkp_system
  has_secure_password
  validates_presence_of :site_name, :config_comment
  validates_length_of :members, :events, :rewards, :occurrences, :jobs, :requirements, :races, in: 1..20

  before_save :scrub_description

  def copy_attrs_and_errors(other)
    self.class.attr_accessible[:default].to_a.each do |attr|
      unless attr.blank?
        eval("self.#{attr} = other.#{attr}")
      end
    end
    other.errors.each do |attr, message|
      self.errors[attr] = message
    end
  end

  def scrub_description
    self.description = Loofah.scrub_fragment(description, :whitewash).to_s
  end
end
