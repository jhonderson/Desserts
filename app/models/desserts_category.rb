class DessertsCategory < ActiveRecord::Base
  has_many :dessert, :dependent => :delete_all

  validates :name,  :presence => true
  validates :image_url, :presence => true

  before_save :resolve_google_drive_url

  def resolve_google_drive_url
    if !self.image_url.nil? && self.image_url.include?("drive.google.com/open")
      self.image_url.gsub!("drive.google.com/open", "drive.google.com/uc")
    end
  end
end
