class Calculator::PaulFlat < Calculator
  preference :box_price, :decimal, :default => 0
  preference :threshold, :decimal, :default => 0
  
  def self.description
    "Flat Rate Per"
  end
  
  #def self.register 
  #  super
  #  ShippingMethod.register_calculator(self)
  #end
  
  def compute(object)
    return unless object.present? and object.line_items.present?
    price = self.preferred_box_price
    limit = self.preferred_threshold
    
   # total_cost_int = object.line_items.map(&:price).sum
  total_cost_int = 0
  
  object.line_items.each do |item|
    total_cost_int += item.amount
  end
    
    return if total_cost_int == 0.00
    
    if total_cost_int < limit
      total_shipping_cost = price
    else
      total_shipping_cost = price
      while total_cost_int > limit
        total_shipping_cost += price
        total_cost_int -= limit
      end
    end
    
    value = (total_shipping_cost * 100).round.to_f / 100
    return value
      
  end
  
end