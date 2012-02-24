class TripLogsController < ApplicationController
	before_filter :find_trip, :only => [:show, :edit, :update, :destroy] 
	
	def new
		@triplog = TripLog.new 
		#raise @triplog.to_yaml
		respond_to do |format| 
			format.html # new.html.erb 
			format.xml { render :xml => @triplog} 
		end
  	end

  	def edit
  	end

  	def index
		@triplogs = TripLog.find(:all) 
		@alldrivers= Driver.find(:all)
		respond_to do |format| 
			format.html # index.html.erb 
			format.xml { render :xml => @triplogs } 
		end
  	end

  	def show
		respond_to do |format| 
			format.html # show.html.erb 
			format.xml { render :xml => @triplog } 
		end
  	end
	
	def create
		@triplog = TripLog.new(params[:trip_log]) 
		respond_to do |format| 
			if @triplog.save flash[:notice] = 'Trip details were successfully created.' 
				format.html { redirect_to(@triplog) } 
				format.xml { render :xml => @triplog, :status => :created, :location => @triplog } 
			else 
				format.html { render :action => "new" } 
				format.xml { render :xml => @triplog.errors, :status => :unprocessable_entity } 
			end 
		end
	end

	private 
	def find_trip 
		@triplog = TripLog.find(params[:id]) 
	end

end
