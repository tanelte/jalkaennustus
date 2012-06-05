# encoding: utf-8
class AddQuestions < ActiveRecord::Migration
  QUESTIONS = [
    {:id => 1, :question => "1. Millise riigi väravatevahe on turniiri lõppedes kõige parem?"},
    {:id => 2, :question => "2. Milline riik saab kõige vähem kollaseid kaarte ühe mängu kohta?"},
    {:id => 3, :question => "3. Mitu punast kaarti näidatakse turniiril kokku?"},
    {:id => 4, :question => "4. Kes lööb turniiril kõige rohkem väravaid?"},
    {:id => 5, :question => "5. Kui palju väravaid lööb turniiri parim väravakütt?"},
  ]
  def up
    QUESTIONS.each do |question|
      q = Question.new(question)
      q.save!
    end
  end

  def down
    QUESTIONS.each do |question|
      Question.find_by_id(question[:id]).destroy
    end
  end
end
