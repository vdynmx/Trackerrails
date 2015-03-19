class User
  include Mongoid::Document

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  # DEVISE FIELDS
  ## Database authenticatable
  field :username,           type: String
  field :email,              type: String
  field :encrypted_password, type: String
  #
  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time
  # # # # # # # #

  # CARRIERWAVE
  mount_uploader :avatar, AvatarUploader
  # # # # # # #

  # CUSTOM FIELDS
  field :token, type: String
  field :member_since, type: DateTime
  field :last_seen, type: DateTime
  field :role, type: String # can be one of ['admin', 'customer']
  field :activation, type: String # ?
  ## field :profile_views, type: Integer # should be replaced with live statistic
  ## field :tracks_count, type: Integer # should be replaced with live statistic
  ## field :news_count, type: Integer # should be replaced with live statistic
  ## field :cars_used, type: Integer # should be replaced with live statistic
  ## field :areas_explored, type: Integer # should be replaced with live statistic
  # field :filtered_upload, type: Boolean # ?
  # field :instant_delete, type: Boolean # seems useless
  # field :active, type: Integer # ?
  # field :debug, type: Integer # ?
  # field :avatar_type, type: String # seems useless
  field :recover, type: Boolean
  # # # # # # #

  # RELATIONS
  has_one :user_stat # IMPORTANT! EXPLOARE BETTER RELATION TYPE HERE
  belongs_to :country
  has_many :tracks
  # # # # # # # # #

  def self.find_by_token token
    # STUB
    User.where(email: 'cybdoom@gmail.com').first
  end
end
