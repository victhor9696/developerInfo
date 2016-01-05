class News < ActiveRecord::Base
  searchkick
  extend  FriendlyId
  include LocaleModule

  has_many :news_avaliables
  has_many :comments_news

  News_per_page = 10


  has_and_belongs_to_many :tags
  friendly_id :title_br, use: :slugged

  def self.search_data query, page, id,role
    if role
      if query == "" || query == " "
        query = nil
      end
      if query.nil?
        News.paginate page: page, per_page: News_per_page
      else
        News.search query, page: page, per_page: News_per_page
      end
    else
      if query == "" || query == " "
        query = nil
      end
      if query.nil?
        News.where(user_id: id).paginate page: page, per_page: News_per_page
      else
        News.where(user_id: id).search query, page: page, per_page: News_per_page
      end
    end
  end

  def which_state
    if self.status == 1
      return I18n.t('form.statusTrue')
    else
     return I18n.t('form.statusFalse')
    end
  end

  def tag_names_br
    name = ""
    self.tags.where(locale_id: Tag::Tag_names_br).each do |tag|
      name = tag.name+","+name
    end
    name
  end

  def tag_names_es
    name = ""
    self.tags.where(locale_id: Tag::Tag_names_es).each do |tag|
      name = tag.name+","+name
    end
    name
  end

  def self.save_tags tag_names, news, loc_id

    NewsTags.where(news_id: news.id,locale_id: loc_id).destroy_all
    tag_names.split(",").each do |tag|
      tag_obj = Tag.where(name: tag,locale_id: loc_id).first
      if tag_obj.nil?
        tag_obj = Tag.create(name: tag,status: true,user_id: news.id,locale_id: loc_id)
      end
      NewsTags.create(news_id: news.id,tag_id: tag_obj.id,locale_id: loc_id)
    end
  end

  def title
    if is_br?
      return self.title_br
    end
    return self.title_es
  end

  def description
    if is_br?
      return self.description_br
    end
    return self.description_es
  end

  def tag_names
    if is_br?
      return self.tag_names_br
    end
    return self.tag_names_es
  end

end
