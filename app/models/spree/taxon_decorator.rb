Spree::Taxon.class_eval do

  def applicable_filters
    fs = []
    # fs << ProductFilters.taxons_below(self)
    ## unless it's a root taxon? left open for demo purposes
    puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    fs << price_filter
    fs
  end

  def format_price(amount)
    Spree::Money.new(amount)
  end


  def price_filter
    v = Spree::Price.arel_table
    all = Spree::PriceFilter.find(:all, :order => :position)
    conds = []
    first = all.delete(all.first)
    conds << [Spree.t(:under_price, :price => format_price(first.to))   , v[:amount].lteq(first.to)]
    last = all.delete(all.last)
    all.each { |item|  conds << [ "#{format_price(item.from)} - #{format_price(item.to)}"        , v[:amount].in(item.from..item.to) ]    }
    conds << [ Spree.t(:or_over_price, :price => format_price(last.from)) , v[:amount].gteq(last.from)]

    { :name   => Spree.t(:price_range),
      :scope  => :price_range_any,
      :conds  => Hash[*conds.flatten],
      :labels => conds.map {|k,v| [k,k]}
      }
  end

end
