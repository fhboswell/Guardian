require 'json'
class DashboardController < ApplicationController

  before_action :authenticate_user!
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]
  before_action :set_user

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

    @objArray << @individual
    puts @objArray

  	
  end
  def set_group
    @group = Group.find(@object["groupid"])
  end

  def set_individual
    @individual = @group.individuals.find(@object["individualid"])
  end
   def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end
  def set_user
    @user = current_user
    puts "made it this far"
    puts @user
    puts current_user.id
    @surl = @user.selfieurl
    
  end

end
