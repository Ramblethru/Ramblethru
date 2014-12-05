class Note < ActiveRecord::Base

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  # acts_as_taggable_on :rambles

  belongs_to :user
  belongs_to :ramble

  validates :body, presence: true

  def self.search(query)
    @note = Note.all
    @note.each do |n|
    #where("n.tag_list", query)
   n.having("n.tag_list like ?", "%#{query.downcase}%")
 end
  end
end
