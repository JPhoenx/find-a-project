class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def create
    @project = Project.create!({
      description: params[:project][:description]
    })
    redirect_to(action: "index")
  end

  def destroy_all
    Project.destroy_all
    flash[:success] = "All projects were deleted"
    redirect_to(admin_path)
  end

end
