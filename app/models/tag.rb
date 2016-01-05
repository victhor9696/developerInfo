class Tag < ActiveRecord::Base
  searchkick
  has_and_belongs_to_many :news
  
  Tag_names_br = 1
  Tag_names_es = 2

  def self.search_data query
    if query == "" || query == " "
      query = nil
    end
    if query.nil?
      return []
    else
      tag = Tag.search query
    end
    return tag
  end
end

module TagAbstract

  def tag_names
    name = ""
    self.tags.all.each do |tag|
      name = tag.name+","+name
    end
    name
  end

end
