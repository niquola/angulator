class Client < ActiveRecord::Base
  validates :email, presence: true
  validates :name, presence: true
  attr_accessible :name, :email, :phone, :summary

  def as_json(options={})
    res = super(options)
    res[:errors] = self.errors.as_json if self.errors.present?
    res
  end
end
