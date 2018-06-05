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


PROJECT_NAME = ["Freelancing Contract", "Recurring Work", "Project for Startup",
  "Navi ltd.", "Vasanth Project", "Poutine Startup", "La Gare", "Le Wagon Mtl",
  "Huge Project", "Small job", "Martin's Poutine", "MG's Code School", "Alex Mr. Tickett",
  "Brett's Filmy", "Simon's Rocket", "Agape's Piggy Bank"]

JOBS_DESCRIPTIONS = ["Senior Programmer", "Team Leader", "Junior Programmer", "Intern",
  "Intermediate Programmer", "Ruby Programmer", "Front End Programmer", "Back End Programmer",
  "Database Expert", "SEO Expert", "Node Programmer", "Javascript Programmer", "React",
  "Network Programmer", "Analyst Programmer", "Software Developper", ".Net Programmer",
  "C++ Programmer", "Change Catalyst", "3D Programmer"]

PROJECT_DESC1 = ["Database", "Front End", "MVP", "Rails Gem", "Legacy Code", "Elastic Search" ]
PROJECT_DESC2 = ["Review", "Integration", "Upgrades", "Implementation"]

puts "STARTING SEEDING PROCEDURES"

# USERS CREATING PROJECT
puts 'CREATING USERS'
urls = ["adele.jpg", "buscemi.jpg", "deniro.jpg", "ergogan.jpg", "hoffman.jpg", "prince.jpg", "putin.jpg", "seydou.jpg", "walken.jpg"]
10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "password123",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    skill_level: User::SKILL_LEVEL.sample,
    phone: Faker::PhoneNumber.cell_phone,
    photo: get_path1(urls.sample),
    github_id: "github.com/" + Faker::Superhero.prefix.gsub(/\s+/, "") + Faker::Superhero.power.gsub(/\s+/, "") + ((1..1000).to_a.sample.to_s),
    linkedin_id: "www.linkedin.com/in/" + Faker::Superhero.prefix.gsub(/\s+/, "") + Faker::Superhero.power.gsub(/\s+/, "") + ((1..1000).to_a.sample.to_s),
    address: "#{Faker::Address.street_address},#{Faker::Address.street_name+Faker::Address.city},#{Faker::Address.postcode}"
  )
  puts "CREATED user.first_name + " " + user.last_name"

  puts "CREATING PROJECTS"

  # PROJECTS
  urls = ["1.png", "2.png", "3.png", "4.png","5.png", "6.png",
    "9.png", "10.png", "11.png"]

    posn = 0

  2.times do
    statuses = ["Started", "Started", "Started", "Started","Completed"]
    deadline = rand(Date.today+21...Date.today+730)
    photos = [""]
    project = Project.create!(
    user_id: user.id,
    name: PROJECT_NAME.sample,
    short_description: pro_langs.sample,
    deadline: deadline,
    # ADD IF STATEMENT BECAUSE ALL DATES ARE -14 days
    start_date: deadline - 14,
    status: statuses.sample,
    photo: get_path(urls.sample),
    description: PROJECT_DESC1.sample + " " + PROJECT_DESC2.sample,
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
      status = ["Filled", "Open"]
      first_skill = pro_langs.sample

      # HAVE TO ADD $
      rate_cents = rand(5...40) * 500/100
      position = Position.create!(
      project: project,
      name: JOBS_DESCRIPTIONS.sample,
      rate_cents: rate_cents,
      status: status.sample,
      first_skill: first_skill,
      second_skill: pro_langs.sample,
      third_skill: pro_langs.sample,
      skill_level: User::SKILL_LEVEL.sample
      )
      puts "position.name created"
    end
  end
end

# USERS APPLICATIONS
puts 'CREATING 10 USERS...'
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
    skill_level: User::SKILL_LEVEL.sample,
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
