class TextsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret", only: :destroy
  def create
    @project = Project.find(params[:project_id])
    @text = @project.texts.create(text_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:project_id])
    @text = @project.texts.find(params[:id])
    @text.destroy

    redirect_to project_path(@project)
  end

  def edit
    @project = Project.find(params[:project_id])
    @text = @project.texts.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @text = @project.texts.find(params[:id])
    if @text.update(text_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  private
  def text_params
    params.require(:text).permit(:titel, :text)
  end
end
