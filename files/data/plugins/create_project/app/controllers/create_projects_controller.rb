class CreateProjectsController < ApplicationController

  def new
    @create_project = CreateProject.new
    @project = Project.new
  end

  def create
    @create_project = CreateProject.new
    @create_project.save_project(params)
  end

  private 


end
