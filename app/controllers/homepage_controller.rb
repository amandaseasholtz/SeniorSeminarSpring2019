class HomepageController < ApplicationController
  def index
  end

  def homepage
  end

  private
    def time_now
        @time = Time.now
    end
end
