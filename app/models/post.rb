class Post < ApplicationRecord
   before_create :set_time_stamps
   before_save :set_time_stamps

  private
  def set_time_stamps
    self.published_at = DateTime.now if self.new_record?
  end
end
