class Institution < ApplicationRecord
  # RELATIONSHIPS
  has_many :majors, dependent: :destroy
  has_many :courses, through: :majors
  has_many :reviews, through: :courses
  has_one_attached :logo

  accepts_nested_attributes_for :majors,
                                 allow_destroy: true
                            
  # VALIDATIONS
  validates :name, 
    presence: true, 
    uniqueness: { case_sensitive: false }, 
    length: {minimum: 2, maximum: 100}
  
  validates :city, 
    presence: true, 
    length: {minimum: 2, maximum: 100} 
  
  validates :country, 
    presence: true, 
    length: {minimum: 2, maximum: 25}  
=begin
  validate :state_is_real

  def state_is_real
    states = ["AL", "AK", "AZ"]
    if self.country == "USA" && !states.include?(self.state)
      errors.add(:state, "is not a US state")
    end
  end
=end


  # FORMATTING
  before_save { self.name = self.name.downcase.titleize }
  before_save { self.city = self.city.downcase.titleize }
  before_validation :statify


  def statify
    if self.state.present?
      self.state = self.state.upcase

      if self.country == "USA"
        case self.state
        when "ALABAMA"
          self.state = "AL"
        when "ALASKA"
          self.state = "AK"
        when "ARIZONA"
          self.state = "AZ"
        when "ARKANSAS"
          self.state = "AR"
        when "CALIFORNIA"
          self.state = "CA"
        when "COLORADO"
          self.state = "CO"
        when "CONNECTICUT"
          self.state = "CT"
        when "DELAWARE"
          self.state = "DE"
        when "FLORIDA"
          self.state = "FL"
        when "GEORGIA"
          self.state = "GA"
        when "HAWAII"
          self.state = "HI"
        when "IDAHO"
          self.state = "ID"
        when "ILLINOIS"
          self.state = "IL"
        when "INDIANA"
          self.state = "IN"
        when "IOWA"
          self.state = "IA"
        when "KANSAS"
          self.state = "KS"
        when "KENTUCKY"
          self.state = "KY"
        when "LOUISIANA"
          self.state = "LA"
        when "MAINE"
          self.state = "ME"
        when "MARYLAND"
          self.state = "MD"
        when "MASSACHUSETTS"
          self.state = "MA"
        when "MICHIGAN"
          self.state = "MI"
        when "MINNESOTA"
          self.state = "MN"
        when "MISSISSIPPI"
          self.state = "MS"
        when "MISSOURI"
          self.state = "MO"
        when "MONTANA"
          self.state = "MT"
        when "NEBRASKA"
          self.state = "NE"
        when "NEVADA"
          self.state = "NV"
        when "NEW HAMPSHIRE"
          self.state = "NH"
        when "NEW JERSEY"
          self.state = "NJ"
        when "NEW MEXICO"
          self.state = "NM"
        when "NEW YORK"
          self.state = "NY"
        when "NORTH CAROLINA"
          self.state = "NC"
        when "NORTH DAKOTA"
          self.state = "ND"
        when "OHIO"
          self.state = "OH"
        when "OKLAHOMA"
          self.state = "OK"
        when "OREGON"
          self.state = "OR"
        when "PENNSYLVANIA"
          self.state = "PA"
        when "RHODE ISLAND"
          self.state = "RI"
        when "SOUTH CAROLINA"
          self.state = "SC"
        when "SOUTH DAKOTA"
          self.state = "SD"
        when "TENNESSEE"
          self.state = "TN"
        when "TEXAS"
          self.state = "TX"
        when "UTAH"
          self.state = "UT"
        when "VERMONT"
          self.state = "VT"
        when "VIRGINIA"
          self.state = "VA"
        when "WASHINGTON"
          self.state = "WA"
        when "WEST VIRGINIA"
          self.state = "WV"
        when "WISCONSIN"
          self.state = "WI"
        when "WYOMING"
          self.state = "WY"
        end

      elsif self.country == "Canada"
        case self.state
        when "ALBERTA"
          self.state = "AB"
        when "BRITISH COLUMBIA"
          self.state = "BC"
        when "MANITOBA"
          self.state = "MB"
        when "NEW BRUNSWICK"
          self.state = "NB"
        when "NEWFOUNDLAND AND LABRADOR"
          self.state = "NL"
        when "NOVA SCOTIA"
          self.state = "NS"
        when "ONTARIO"
          self.state = "ON"
        when "PRINCE EDWARD ISLAND"
          self.state = "PE"
        when "QUEBEC"
          self.state = "QC"
        when "SASKATCHEWAN"
          self.state = "SK"
        end

      else
        self.state = self.state.titleize
      end

    end
  end



end
