class GithubService
  require 'pry'
  attr_reader :access_token

  def initialize(access_hash = nil)
    @access_token = access_hash["access_token"] if access_hash
  end

  def authenticate!(client_id, client_secret, code)
    response = Faraday.post "https://github.com/login/oauth/access_token" do |req|
      req.headers['Accept'] = 'application/json'
      req.body = {"client_id"=> client_id, "client_secret"=> client_secret, "code"=> code}
    end
    access_hash = JSON.parse(response.body)
    @access_token = access_hash["access_token"]
    access_hash
  end

  def get_username
    user_response = Faraday.get "https://api.github.com/user" do |req|
<<<<<<< HEAD
      req.headers['Authorization'] = "token #{self.access_token}"
      req.headers['Accept'] = 'application/json'
    end
   user_json = JSON.parse(user_response.body)
   user_json["login"]
=======
       req.headers['Authorization'] = "token #{self.access_token}"
       req.headers['Accept'] = 'application/json'
     end
    user_json = JSON.parse(user_response.body)
    user_json["login"]
>>>>>>> dda808de02288c8a1bc201f921b68ee5316c0384
  end

  def get_repos
    response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{self.access_token}", 'Accept' => 'application/json'}
    repos_array = JSON.parse(response.body)
    repos_array.map{|repo| GithubRepo.new(repo) }
  end

  def create_repo(name)
    Faraday.post "https://api.github.com/user/repos", {name: name}.to_json, {'Authorization' => "token #{self.access_token}", 'Accept' => 'application/json'}
  end

end
