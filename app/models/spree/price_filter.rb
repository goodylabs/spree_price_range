module Spree
  class PriceFilter < ActiveRecord::Base
    attr_accessible :from, :position, :to
  end
end
