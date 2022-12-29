class CreateProjectsController < ApplicationController

  def new
    @create_project = CreateProject.new
    @project = Project.new
  end

  def create
    @create_project = CreateProject.new(set_params)
    if @create_project.save
      @create_project.save_project(set_params)
      respond_to do |format|
        format.html do
          flash[:notice] = l(:notice_successful_create)
          redirect_to new_project_plugin_path
        end
      end 
    else 
      respond_to do |format|
        format.html do
          flash[:error] = 'Não foi possível criar o Projeto'
          redirect_to new_project_plugin_path
        end
      end 
    end 
  end

  private 

    def set_params
      params.require(:create_project).permit(:name, :identifier, :description, :is_public, :inherit_members, :tracker_ids)
    end 

end
