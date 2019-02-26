class InitializeNewAlpacaSkills
  SKILLS = [
    Skill.find_by(name: 'Strength'),
    Skill.find_by(name: 'Speed'),
    Skill.find_by(name: 'Wisdom')
  ]

  def initialize(alpaca)
    @alpaca = alpaca
  end

  def call
    SKILLS.each do |skill|
      @alpaca.alpaca_skills.create(skill_id: skill.id, level: 1)
    end
  end
end
