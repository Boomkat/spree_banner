module Spree
  class BannerBoxLocation < ActiveRecord::Base

    has_many :banner_box, dependent: :destroy, class_name: 'BannerBox'
    has_many :banner_box_hero, dependent: :destroy, class_name: 'BannerBoxHero'

    validates_presence_of :page
    validates_presence_of :location

    def banner_box_for_location(location)
      self.where(:location => location).first
    end

    def carousel(page)
      self.where(:page => page, :location => 'carosuel')
    end

    def page_location
      "#{page} - #{location}".capitalize!
    end

  end
end