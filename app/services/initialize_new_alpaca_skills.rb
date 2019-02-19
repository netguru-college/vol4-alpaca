class InitializeNewAlpacaSkills
  SKILLS = [
    Skill.find_by(name: 'Strength'),
    Skill.find_by(name: 'Speed'   ),
    Skill.find_by(name: 'Wisdom'  ),
  ]

  def initialize(alpaca)
    @alpaca = alpaca
  end

  def call
    SKILLS.each do |skill|
      AlpacaSkill.new(alpaca_id: @alpaca.id, skill_id: skill.id, level: 1).save
    end
  end
end
