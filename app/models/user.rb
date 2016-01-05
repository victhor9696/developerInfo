class User < ActiveRecord::Base
  extend FriendlyId
  searchkick

  Users_per_page = 10

  has_many :news_avaliables

  validates :name, presence: true
  validates_uniqueness_of :email, presence: true
  validates :password, presence: true
  friendly_id :name, use: :slugged

  before_save :encrypt_password

  def self.role
    role =   {
      0 => I18n.t('form.userComm'),
      1 => I18n.t('form.userAdmin')
    }
    return role
  end

  def self.encrypt password
    Digest::SHA1.hexdigest("megaman_#{password}_cafeina")
  end

  def self.auth(email,password)
    where(["email=? and password=? and status=1",email, User.encrypt(password) ]).first
  end

  def self.search_data query, page
    if query == ""
      query = nil
    end
    if query.nil?
      User.paginate page: page, per_page: Users_per_page
    else
      User.search query, page: page, per_page: Users_per_page
    end
  end

  def is_role
    if self.role == 1
      return I18n.t('form.userAdmin')
    else
     return I18n.t('form.userComm')
    end
  end

  def which_state
    if self.role == 1
      return I18n.t('form.statusTrue')
    else
     return I18n.t('form.statusFalse')
    end
  end

  private
    def encrypt_password
      if !self.id.nil?
        if ((self.password.nil?) || (User.find(self.id).password == self.password))
           return
        end
      end
      self.password = User.encrypt self.password
    end
end
