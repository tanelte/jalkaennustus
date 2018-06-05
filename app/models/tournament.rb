class Tournament < ActiveRecord::Base
  
  def mm
    type == 'MM'
  end
  
  def em2016
    type == 'EM2016'
  end

  self.inheritance_column = "not_sti"
  
end