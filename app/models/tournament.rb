class Tournament < ActiveRecord::Base
  
  def mm
    type == 'MM'
  end
  
  def em2012
    type == 'EM'
  end

  def em2016
    type == 'EM2016'
  end

  def em2020
    type == 'EM2020'
  end

  self.inheritance_column = "not_sti"
  
end