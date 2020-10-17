class Sale < ActiveRecord::Base

  def finished?
    ends_on < Date.current
  end

  def upcoming?
    #could use self.starts_on
    starts_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end

end
