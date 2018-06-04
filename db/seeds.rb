require 'faker'
require 'json'
require 'open-uri'

def get_path(logo)
  File.new(Rails.root.join("app/assets/images/logos/#{logo}"))
end

def get_path1(image)
  File.new(Rails.root.join("app/assets/images/pictures/#{image}"))
end


Project.destroy_all
Group.destroy_all
UserPosition.destroy_all
Position.destroy_all
User.destroy_all

# PROGRAMMING LANGUAGES EXTRACTED
url = 'https://raw.githubusercontent.com/scienceai/list-of-programming-languages/master/data/data.json'
  pl_data_extracted = open(url).read
  pl_data = JSON.parse(pl_data_extracted)
  pro_langs = pl_data["itemListElement"].map do | element |
  element["item"]["name"]
  end

puts "STARTING SEEDING PROCEDURES"

# USERS CREATING PROJECT
puts 'CREATING USERS'
urls = ["adele.jpg", "buscemi.jpg", "deniro.jpg", "ergogan.jpg", "hoffman.jpg", "prince.jpg", "putin.jpg", "seydou.jpg", "walken.jpg"]
skills = ["Junior programmer", "Senior programmer", "Intermediate programmer"]
10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "password123",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    skill_level: skills.sample,
    phone: Faker::PhoneNumber.cell_phone,
    photo: get_path1(urls.sample),
    github_id: "github.com/" + Faker::Superhero.prefix.gsub(/\s+/, "") + Faker::Superhero.power.gsub(/\s+/, "") + ((1..1000).to_a.sample.to_s),
    linkedin_id: "www.linkedin.com/in/" + Faker::Superhero.prefix.gsub(/\s+/, "") + Faker::Superhero.power.gsub(/\s+/, "") + ((1..1000).to_a.sample.to_s),
    address: "#{Faker::Address.street_address},#{Faker::Address.street_name+Faker::Address.city},#{Faker::Address.postcode}"
  )
  puts "CREATED user.first_name + " " + user.last_name"

  puts "CREATING PROJECTS"

  # PROJECTS
  urls = ["1.png", "2.png", "3.png", "4.png",
    "5.png", "6.png",
    "9.png", "10.png", "11.png"]
    posn = 0
  2.times do
    statuses = ["Started", "Completed"]
    deadline = rand(Date.today+21...Date.today+730)
    photos = [""]
    project = Project.create!(
    user_id: user.id,
    name: Faker::Job.field,
    short_description: pro_langs.sample,
    deadline: deadline,
    # ADD IF STATEMENT BECAUSE ALL DATES ARE -14 days
    start_date: deadline - 14,
    status: statuses.sample,
    photo: get_path(urls.sample),
    description: Faker::Job.title
    )

    puts "Project project.name created"
  # GROUPS
  (1..5).to_a.sample.times do
    group = Group.create!(
    user_id: user.id,
    name: Faker::Job.field,
    description: Faker::ChuckNorris.fact
    )
    puts "Group: group.name created"

    # GROUP MEMBERSHIPS
    puts 'creating GROUP MEMBERSHIPS'
    (3..5).to_a.sample.times do
      statuses = ["Pending", "Approved", "Approved"]
      category = "Member"
      group_membership = GroupMembership.create!(
      status: statuses.sample,
      category: category,
      user: User.all.sample,
      group_id: group.id
      )
      puts " GROUP MEMBERSHIP created"
    end

    # POSITIONS
    puts 'CREATING ON PROJECTS'
    (2..7).to_a.sample.times do
      skill_level = ["Junior programmer", "Senior programmer", "Intermediate programmer"]
      status = ["Filled", "Open"]
      first_skill = pro_langs.sample

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
      puts "position.name created"
    end
  end
end

# USERS APPLICATIONS
puts 'CREATING 10 USERS...'
skills = ["Junior programmer", "Senior programmer", "Intermediate programmer"]
urls = ["adele.jpg", "buscemi.jpg", "deniro.jpg", "ergogan.jpg", "hoffman.jpg",
  "prince.jpg", "putin.jpg", "seydou.jpg", "walken.jpg"]
10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "password123",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    photo: get_path1(urls.sample),
    phone: Faker::PhoneNumber.cell_phone,
    github_id: "github.com/" + Faker::Superhero.prefix.gsub(/\s+/, "") + Faker::Superhero.power.gsub(/\s+/, "") + ((1..1000).to_a.sample.to_s),
    linkedin_id: "www.linkedin.com/in/" + Faker::Superhero.prefix.gsub(/\s+/, "") + Faker::Superhero.power.gsub(/\s+/, "") + ((1..1000).to_a.sample.to_s),
    # photo: "cloudinary_url"
    skill_level: skills.sample,
    address: "#{Faker::Address.street_address},#{Faker::Address.street_name+Faker::Address.city},#{Faker::Address.postcode}"
  )
  puts "Created user: " + user.first_name + " " + user.last_name


  # USER_POSITION
  3.times do
  status = ["Accepted", "Refused", "In review"]
  puts "Creating User Positions"
  rate_cents = rand(5...40) * 500/100
  user_position = UserPosition.create!(
    user_id: user.id,
    position: Position.all.sample,
    status: status.sample,
    rate_cents: rate_cents
  )
  end
end
end

puts "SEED IS FINISHED AND FRANCIS POITRAS SAYS HI!!!"
