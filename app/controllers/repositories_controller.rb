class RepositoriesController < ApplicationController
  def index
    github = GithubService.new(session[:service])
    @repos_array = github.get_repos
  end

  def create
<<<<<<< HEAD
    github = GithubService.new(session[:service])
    github.create_repo(params[:name])
    redirect_to root_path
=======
    github = GithubService.new(session{:service})
    github.create_repo(params[:name])
>>>>>>> dda808de02288c8a1bc201f921b68ee5316c0384
  end
end
