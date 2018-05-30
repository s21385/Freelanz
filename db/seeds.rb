require 'faker'
require 'json'
require 'open-uri'


User.destroy_all
Project.destroy_all
Position.destroy_all
UserPosition.destroy_all


# Group_membership.destroy_all
# Goup.destroy_all
# Discussion.destroy_all
# Message.destroy_all

# UPLOAD LOCAL FILES
# def get_path(image)
#   File.new(Rails.root.join("app/assets/images/tux_pictures/#{image}"))
# end

# PROGRAMMING LANGUAGES EXTRACTED
url = 'https://raw.githubusercontent.com/scienceai/list-of-programming-languages/master/data/data.json'
  pl_data_extracted = open(url).read
  pl_data = JSON.parse(pl_data_extracted)
  pro_langs = pl_data["itemListElement"].map do | element |
  element["item"]["name"]
  end


puts "STARTING SEEDING PROCEDURES"

# USERS CREATING PROJECT
puts 'Creating fake users...'
skills = ["Junior programmer", "Senior programmer", "Intermediate programmer"]
10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "password123",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    photo: Faker::Placeholdit.image("50x50", 'gif', 'ffffff'),
    skill_level: skills.sample,
    address: "#{Faker::Address.street_address},#{Faker::Address.street_name+Faker::Address.city},#{Faker::Address.postcode}"
  )
  puts "Created user: " + user.first_name + " " + user.last_name

  puts "creating fake projects"



  # PROJECTS
  2.times do
    deadline = rand(Date.today+21...Date.today+730)
    project = Project.create!(
    user_id: user.id,
    name: Faker::Job.field,
    short_description: pro_langs.sample,
    deadline: deadline,
    # ADD IF STATEMENT BECAUSE ALL DATES ARE -14 days
    start_date: deadline - 14,
    description: Faker::Job.title
    )
    puts "Project: #{project.name} created"

    # POSITIONS
    puts 'creating fake Positions'
    4.times do
      skill_level = ["Junior programmer", "Senior programmer", "Intermediate programmer"]
      status = ["Pending", "Accepted", "Rejected"],
      first_skill = pro_langs.sample,
      # HAVE TO ADD $
      rate_cents = rand(5...40) * 500/100
      position = Position.create!(
      project: project,
      name: Faker::Job.field,
      rate_cents: rate_cents,
      status: status.sample,
      first_skill: first_skill,
      second_skill: pro_langs.sample,
      third_skill: pro_langs.sample,
      skill_level: skill_level.sample
      )
      puts " #{position.name} created"
    end
  end
end

# USERS APPLICATIONS
puts 'Creating 10 fake users...'
skills = ["Junior programmer", "Senior programmer", "Intermediate programmer"]
10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "password123",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    # photo: "cloudinary_url"
    skill_level: skills.sample,
    address: "#{Faker::Address.street_address},#{Faker::Address.street_name+Faker::Address.city},#{Faker::Address.postcode}"
  )
  puts "Created user: " + user.first_name + " " + user.last_name


  # USER_POSITION
  3.times do
  status = ["Approved", "Denied", "Pending"]
  puts "Creating Fake User Positions"
  rate_cents = rand(5...40) * 500/100
  user_position = UserPosition.create!(
    user_id: user.id,
    position: Position.all.sample,
    status: status.sample,
    rate_cents: rate_cents
  )
  end
  puts SEEDS COMPLETED
end
