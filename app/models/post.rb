class Post < ApplicationRecord
   before_create :set_time_stamps
   before_save :set_time_stamps

   belongs_to :author, class_name: "User", foreign_key: "user_id"
	 validates :title, :content, :user_id, presence: true

  private
  def set_time_stamps
    self.published_at = DateTime.now if self.new_record?
  end
end
