class Calculator::PaulFlat < Calculator
  preference :box_price, :decimal, :default => 0
  preference :threshold, :decimal, :default => 0
  
  def self.description
    "Flat Rate Per"
  end
  
  def self.register 
    super
    ShippingMethod.register_calculator(self)
  end
  
  def compute(object)
    total_cost = objects.line_items.map(&:price).sum
    total_shipping_cost = 0
    if total_cost < self.preferred_threshold
     total_shipping_cost += self.preferred_box_price
    else
      while total_cost > self.preferred_threshold
      total_cost -= preferred_threshold
      total_shipping_cost += self.preferred_box_price
      end
    end
    
    return total_shipping_cost
      
  end
  
end