class Sale < ActiveRecord::Base


def self.active
  where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
end

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

# scope :active, -> { where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current).any?
# Active Record Scope - make it vry easy to query sales
# sale.active.for_city('Toronto').above(5).any?