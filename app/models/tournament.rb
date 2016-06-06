class Tournament < ActiveRecord::Base
  
  attr_accessible :id, :name, :type
  
  def mm
    type == 'MM'
  end
  
  def em2016
    type == 'EM2016'
  end
  
  set_inheritance_column "not_sti"
  
end