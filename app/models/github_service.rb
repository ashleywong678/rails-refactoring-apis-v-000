class GithubService

  attr_accessor :access_token

  def initialize(options = {})
    self.access_token = options['access_token']
  end

end