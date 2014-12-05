class Note < ActiveRecord::Base

  acts_as_taggable

  belongs_to :user
  belongs_to :ramble

  validates :body, presence: true

 #  def self.search(query)
 #    #where("n.tag_list", query)
 #   where("tag_list like ?", "%#{query.downcase}%")
 # end
 #  end
end
