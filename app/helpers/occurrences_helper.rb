module OccurrencesHelper
  def get_requirements(requirement,character)
    requirements = requirement.find{|s| (s.used_occurrence == @occurrence) && s.character == character}
    requirements ||= requirement.find{|s| s.used_occurrence.nil? && s.character == character}
  end
end
