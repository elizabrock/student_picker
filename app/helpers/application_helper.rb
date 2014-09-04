module ApplicationHelper
  def formatted_last_called_at_for(student)
    if student.last_called_at.nil?
      "(never)"
    elsif student.last_called_at >= 10.minutes.ago
      "(just now)"
    elsif student.last_called_at >= 1.day.ago
      # http://www.ruby-doc.org/core-2.1.2/Time.html#method-i-strftime
      "(#{student.last_called_at.strftime("%l:%M %p").lstrip})"
    elsif student.last_called_at >= 2.days.ago
      "(yesterday)"
    else
      "(long, long ago)"
    end
  end
end
