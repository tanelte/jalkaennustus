# encoding: UTF-8
class ChangeQuestion < ActiveRecord::Migration
  def up
    q = Question.find_by_id 4
    q.update_attribute(:question, '4. Kes lööb turniiril kõige rohkem väravaid ja võidab Kuldse Saapa auhinna?')
  end

  def down
    q = Question.find_by_id 4
    q.update_attribute(:question, '4. Kes lööb turniiril kõige rohkem väravaid?')
  end
end
