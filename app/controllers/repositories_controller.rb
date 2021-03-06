class RepositoriesController < ApplicationController
  def index
    response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    @repos_array = JSON.parse(response.body)
  end

  def create
    github_serviceObj = GithubService.new('access_token' => session[:token])
    github_serviceObj.create_repo(params[:name])
    redirect_to root_path
  end
end
