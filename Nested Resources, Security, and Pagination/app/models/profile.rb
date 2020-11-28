class Profile < ActiveRecord::Base
  belongs_to :user

  validate :first_name_or_last_name
  validate :male_or_female
  validate :not_sue_male

  def first_name_or_last_name
    if (first_name.nil? || first_name.empty?) && (last_name.nil? || last_name.empty?)
      errors.add(:first_name, "Missing first_name and last_name. Define at least one of those.")
    end
  end

  def male_or_female
    if !gender.nil? && !gender.in?(["male", "female"])
      errors.add(:gender, "Gender must be ether Male or Female")
    end
  end

  def not_sue_male
    if gender == "male" && first_name == "Sue"
      errors.add(:gender, "Sue can't be assigned to a male. Change your name or your gender")
    end
  end

  scope :order_by_birth_year, -> { order :birth_year} 
  scope :get_all_profiles, -> (startYear, endYear) {
    Profile.where("birth_year BETWEEN :start_year AND :end_year", 
      start_year: startYear, end_year: endYear).order_by_birth_year
  }
end
