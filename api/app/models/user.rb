class User < ApplicationRecord
  has_many :tokens,
    dependent: :destroy,
    as: :owner,
    inverse_of: :owner
  
  # DEVISE: :omniauthable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :lockable


  def refresh_token
    tokens.where(active: true, token_type: "refresh").last
  end

  def find_or_create_refresh_token
    if !refresh_token
      create_refresh_token
    end

    refresh_token
  end

  def create_refresh_token
    Token.create_token_by_token_type("refresh", self)
  end
end
