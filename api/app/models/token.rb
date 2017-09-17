class Token < ApplicationRecord
  belongs_to :owner, polymorphic: true

  validates :token_type, presence: true
  validates :token,
    presence: true,
    uniqueness: true

  def self.create_token_by_token_type(type, owner_resource)
    Token.create(
      owner_type: owner_resource.class.to_s,
      owner_id: owner_resource.id,
      active: true,
      token_type: type,
      token: generate_token([
        owner_resource.class.to_s,
        owner_resource.id
      ])
    )
  end

  private

  def self.generate_token(params)
    params << [ Time.now, rand.to_s[2..11] ]
    Digest::SHA512.hexdigest( params.to_s )
  end
end
