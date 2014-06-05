class Tournament < ActiveRecord::Base
  
  attr_accessible :id, :name, :type
  
  def mm
    type == 'MM'
  end
  
  set_inheritance_column "not_sti"
  
end