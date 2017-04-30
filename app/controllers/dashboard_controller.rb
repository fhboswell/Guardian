require 'json'
class DashboardController < ApplicationController

  
  
  before_action :authenticate_user!

  def index
    @objArray = Array.new
  	@user = User.where(id: current_user)
  	puts current_user.individualid
  
  	s = current_user.individualid[0]
	  puts s.split(":")

	
    @object = JSON.parse(s)
    puts @object
    set_group
    set_individual
    puts @group
    @individual
  	puts "khjsdadfshkahksdfh"
    @objArray << @individual
    puts @objArray
  	
  end
  def set_group
    @group = Group.find(@object["groupid"])
  end

  def set_individual
    @individual = @group.individuals.find(@object["individualid"])
  end

end
