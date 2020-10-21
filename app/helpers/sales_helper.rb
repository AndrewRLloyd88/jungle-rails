module SalesHelper


def active_sale?
  # query active record
Sale.active.any?
end


def active_sale_name?
if Sale.active.any?
# sale = Sale.find_by_sql("SELECT name FROM sales WHERE starts_on < NOW() AND ends_on > NOW()")
sale = Sale.where("starts_on < ? AND ends_on > ?", Date.current(), Date.current()).first
puts sale
end
sale.name
end

def sale_percent_off
  if Sale.active.any?
  # sale = Sale.find_by_sql("SELECT name FROM sales WHERE starts_on < NOW() AND ends_on > NOW()")
  sale = Sale.where("starts_on < ? AND ends_on > ?", Date.current(), Date.current()).first
  puts sale
  end
  sale.percent_off
end


end

