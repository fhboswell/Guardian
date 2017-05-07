require 'json'
class DashboardController < ApplicationController

  before_action :authenticate_user!
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]
  before_action :set_user

  def index
    @objArray = Array.new
  	@user = User.where(id: current_user)
  	s = current_user.individualid[0]
    @object = JSON.parse(s)
    set_group
    set_individual
    @objArray << @individual

  	
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
    @surl = @user.selfieurl

  end

end
