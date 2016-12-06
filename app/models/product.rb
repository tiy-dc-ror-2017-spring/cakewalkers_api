require 'securerandom'
class Product < ApplicationRecord
  has_many :bake_jobs
  before_save :create_code, on: :create

  def create_code
    self[:code] = SecureRandom.uuid
  end
end
