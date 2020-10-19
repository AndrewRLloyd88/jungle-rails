module SalesHelper

def active_sale?
  # query active record
Sale.active.any?
end

end