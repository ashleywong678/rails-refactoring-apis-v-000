class GithubService

  attr_accessor :access_token

  def initialize(options = {})
    self.access_token = options['access_token']
  end

  def authenticate!(client, secret, code)
    resp = Faraday.post "https://github.com/login/oauth/access_token", {client_id: client, client_secret: secret, code: code}, {'Accept' => 'application/json'}
    access_hash = JSON.parse(resp.body)
    self.access_token = access_hash["access_token"]
  end

  def get_username
    resp = Faraday.get("https://api.github.com/user") do |req|
      req.params["client_id"] = ENV["GITHUB_CLIENT"]
      req.params["client_secret"] = ENV["GITHUB_SECRET"]
      req.params["code"] = params[:code]
      req.params["Authroization"] = self.token
    end
    body = JSON.parse(resp.body)
  end

end