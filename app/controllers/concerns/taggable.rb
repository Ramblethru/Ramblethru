module Taggable
  extend ActiveSupport::Concern

  def tag_names
    tags.map(&:name)
  end

  def tag_list
    tag_names.join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip.downcase).first_or_create!
    end
  end

  module ClassMethods
  end
end