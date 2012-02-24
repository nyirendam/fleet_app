class PagesController < ApplicationController
  def home
	@title = "Home"
  end

  def car
	@title = "Car"
  end

  def driver
	@title = "Driver"
  end

  def dailyLog
	@title = "Daily Car Log"
  end

end
