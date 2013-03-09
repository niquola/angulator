class Client < ActiveRecord::Base
  validates :email, presence: true
  validates :name, presence: true
  attr_accessible :name, :email, :phone, :summary

  class << self
    def search(term)
      if term.present?
        self.where(['name ilike ?', "#{term}%"])
      else
        self
      end
    end
  end

  def as_json(options={})
    res = super(options)
    res[:errors] = self.errors.as_json if self.errors.present?
    res
  end
end
