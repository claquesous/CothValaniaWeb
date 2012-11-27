module OccurrencesHelper
  def get_requirements(requirement,character)
    requirements = requirement.find{|s| (s.used_occurrence == @occurrence) && s.character == character}
    if requirements.nil?
      requirement.find{|s| s.used_occurrence.nil? && s.character == character}
    else
      requirements
    end
  end
end
