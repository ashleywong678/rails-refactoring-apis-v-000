class GithubService

  attr_accessor :access_token, :username

  def initialize(options = {})
    self.access_token = options['access_token']
  end

  def authenticate!(client, secret, code)
    resp = Faraday.post "https://github.com/login/oauth/access_token", {client_id: client, client_secret: secret, code: code}, {'Accept' => 'application/json'}
    access_hash = JSON.parse(resp.body)
    self.access_token = access_hash["access_token"]
  end

  def get_username
    user_response = Faraday.get "https://api.github.com/user", {}, {'Authorization' => "token #{self.access_token}", 'Accept' => 'application/json'}
    user_json = JSON.parse(user_response.body)
    self.username = user_json["login"]
  end

end