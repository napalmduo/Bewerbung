class ProjectsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret", except: [:index, :show]

  def new
    @project = Project.new
  end

  def index
    @project = Project.all
    @dropdown_options = [["Alle Projekte", "0"]]
    @dropdown_options += Project.all.map {|p| [p.Name, p.id]}
    if params[:filter] != nil
      @project = Project.where(id: params[:filter])
    end
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to project_path
  end

  private
  # Traue keinem unheimlichen Parameter aus dem Internet, erlaube nur diese aus der Whitelist ;-)
  def project_params
    params.require(:project).permit(:Name)
  end
end