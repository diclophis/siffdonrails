#

class WelcomeController < ApplicationController
  def index
    @upcoming_categories = UpcomingCategory.find(:all)
    @music = UpcomingCategory.find(:all, :conditions => ["name = ?", "Media"])
  end
end
