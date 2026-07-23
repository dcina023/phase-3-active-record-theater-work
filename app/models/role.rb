class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    auditions.pluck(:actor)
  end

  def locations
    auditions.pluck(:location)
  end

  def lead
    hired_audition = auditions.find_by(hired: true)

    if hired_audition
      hired_audition.actor
    else
      "no actor has been hired for this role"
    end
  end

  def understudy
    hired_understudy = auditions.where(hired: true)[1]

    if hired_understudy
      hired_understudy.actor
    else
      "no actor has been hired for understudy for this role"
    end
  end
end
