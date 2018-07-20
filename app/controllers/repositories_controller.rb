class RepositoriesController < ApplicationController
  def index
    github = GithubService.new(session[:service])
    @repos_array = github.get_repos
  end

  def create
    github = GithubService.new(session[:service])
    github.create_repo(params[:name])
    redirect_to root_path
  end
end
