
class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @projects = Project.all
  end

  def linkedin
    headers = {
      "Host" => "www.linkedin.com",
      "Content-Type" => "application/x-www-form-urlencoded"
    }

    body = {
      "grant_type" => "authorization_code",
      "code" => params[:code],
      "redirect_uri" => "http://localhost:3000/pages/linkedin_callback",
      "client_id" => "#{ENV['LINKEDIN_CLIENT_ID']}",
      "client_secret" => "#{ENV['LINKEDIN_SECRET_ID']}"
    }

    uri = URI.parse("https://www.linkedin.com/oauth/v2/accessToken")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri, headers)
    request.body = body.to_query
    response = http.request(request)
    results = JSON.parse(response.body)

    uri = URI.parse("https://api.linkedin.com/v1/people/~:(id,first-name,last-name,picture-url,public-profile-url,email-address)?format=json")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri, {
      "Host" => "api.linkedin.com",
      "Connection" => "Keep-Alive",
      "Authorization" => "Bearer #{results["access_token"]}"
    })

    response = http.request(request)
    results = JSON.parse(response.body)

    user = User.find_by(linkedin_id: results["id"])

      if user.nil?
      # OR CREATE A NEW USER
      # USED GITHUB COLUMN FOR LINKED IN PROFILE PAGE JUST AS A TEST TO SEE VIEW
        user = User.create!(email: results["emailAddress"], linkedin_id: results["id"], password: Devise.friendly_token[0,20], first_name: results["firstName"], last_name: results["lastName"], photo: results["pictureUrl"], github_id: results["publicProfileUrl"])
      end
      # results["publicProfileUrl"] for Linkedin public profile

    sign_in(user, scope: :user)

    # Change to user/show and display form with addition features needed for db
    redirect_to additional_info_path
  end

  def additional_info
    @user = current_user
  end

  # def position
  #   @projects = Project.find(params[:id])
  #   @positions = Position.find(:project_id)
  #   @positions = Position.all

  # end
end
