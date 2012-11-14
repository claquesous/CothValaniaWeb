module OccurrencesHelper
  def get_requirements(r,c)
    requirements = r.select{|s| (s.used_occurrence == @occurrence) && s.character == c}.first
    if requirements.nil?
      r.select{|s| s.used_occurrence.nil? && s.character == c}.first
    else
      requirements
    end
  end
end
