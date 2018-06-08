require 'faker'
require 'json'
require 'open-uri'

def get_path(logo)
  "logos/#{logo}"
  # File.new(Rails.root.join("app/assets/images/logos/#{logo}"))
end

def get_path1(image)
  "pictures/#{image}"
  # File.new(Rails.root.join("app/assets/images/pictures/#{image}"))
end

def get_path2(logo)
  "logos/comp_logos/#{logo}"
  # File.new(Rails.root.join("app/assets/images/logos/comp_logos/#{logo}"))
end

PositionSkill.destroy_all
Skill.destroy_all
Position.destroy_all
Project.destroy_all
Group.destroy_all
UserPosition.destroy_all
User.destroy_all

# # PROGRAMMING LANGUAGES EXTRACTED
# url = 'https://raw.githubusercontent.com/scienceai/list-of-programming-languages/master/data/data.JSON'
#   pl_data_extracted = open(url).read
#   pl_data = JSON.parse(pl_data_extracted)
#   pro_langs = pl_data["itemListElement"].map do | element |
#   element["item"]["name"]
#   end

pro_langs = ["Android", "AngularJS", "AWS", "Backbone.js", "C", "C++", "C#", "CoffeeScript",
"Clojure", "CommonLisp", "CSS", "Design Pattern", "Django", "Erlang", "Flask",
"Git", "Go", "Groovy", "Haskell", "HTTP API Design", "HTML", "iOS", "JSON",
"Java", "Javascript", "jQuery", "Kotlin", "Makefile", "Objective-C", "Perl",
"PHP", "Python", "R", "React", "Redux", "Ruby", "Ruby on Rails", "Rust", "Sass","Scala",
"Shell", "SpringFramework", "Swift", "SQL", "Unreal Engine", "Vimscript", "Vue.js", "XML"]


PROJECT_NAMES = ["Long-Term Contract", "Recurring Work", "Quick Project", "Time-Based Contracts",
  "Cutting-Edge Technology", "No Experience Needed", "Redesign Work", "Upgrades Needed",
  "Migration Job", "Legacy Code Maintenance", "Code Review", "Systems Integration"]

COMPANY_NAMES = {
  "Le Wagon" => "lewagon.png",
  "Ubisoft" => "ubisoft.svg",
  "CGI" => "cgi.jpg",
  "Microsoft" => "microsoft.svg",
  "SAP" => "sap.png",
  "Oracle" => "oracle.png",
  "Lightspeed" => "lightspeed.svg",
  "Busbud" => "Busbud.png",
  "Mylo" => "mylo.png",
  "Nestready" => "nestready.png",
  "Koolicar" => "koolicar.png",
  "Chronogolf" => "chronogolf.png",
  "Shopify" => "shopify.svg",
  "Tesla" => "tesla.svg",
  "Autodesk" => "autodesk.png",
  "Github" => "github.png",
  "Matrox" => "matrox.svg",
  "Cimpl" => "Cimpl.png",
  "ESignLive" => "esignlive.png",
  "SurMesur" => "surmesur.png",
  "SweetIQ" => "sweetiq.png",
  "Agape" => "computer.png",
  "Feeling Filmy" => "computer.png",
  "Pizazz"=> "Pizazz.png"
}

def company_names
  all_company_names = []
  COMPANY_NAMES.each do |name, logo|
    all_company_names += [name]
  end
  return all_company_names
end

def company_logos
  all_company_logos = []
  COMPANY_NAMES.each do |name, logo|
    all_company_logos += [logo]
  end
  return all_company_logos
end

BACKEND_SKILLS = {
  "Ruby" => "ruby.svg",
  "Mongo DB" => "mongodb.svg",
  "PostGres"=> "postgres.svg",
  "SQL" => "mysql.svg",
  "Node" => "nodejs.svg",
  "PHP" => "php.svg",
  "Python" => "python.svg",
  "NoSQL" => "nosql.png",
  ".NET" => "net.svg",
  "Perl" => "perl.svg",
  "C" => "c.svg",
  "C#" => "c#.png"
}

MOBILE_SKILLS = {
  "Swift" => "swift.svg",
  "React Native" => "react.svg",
  "Objective-C" => "objc.png",
  "Java" "C" => "java.svg",
  "Kotlin" => "kotlin.svg",
  "HTML" => "html.svg",
  "IOS" => "ios.svg"
}

FRONT_END_SKILLS = {
  "Javascript" => "javascript.svg",
  "React" => "react.svg",
  "JQuery" => "jquery.svg",
  "AngularJS" => "angularjs.svg",
  "HTML 5" => "html.svg",
  "CSS" => "css.svg",
  "Sass" => "sass.svg",
  "Azure" => "azure-3.svg"
}

ALL_SKILLS = BACKEND_SKILLS.merge(FRONT_END_SKILLS).merge(MOBILE_SKILLS)

JOBS_DESCRIPTIONS = ["Senior Programmer", "Team Leader", "Junior Programmer", "Intern",
  "Intermediate Programmer", "Ruby Programmer", "Front End Programmer", "Back End Programmer",
  "Database Expert", "SEO Expert", "Node Programmer", "Javascript Programmer", "React",
  "Network Programmer", "Analyst Programmer", "Software Developer", ".Net Programmer",
  "C++ Programmer", "Change Catalyst", "3D Programmer"]

PROJECT_DESC1 = ["Database", "Front End", "MVP", "Rails Gem", "Legacy Code",
  "Elastic Search" ]

PROJECT_DESC2 = ["Review", "Integration", "Upgrades", "Implementation"]

def skill_names
  all_skill_names = []
  ALL_SKILLS.each do |name, logo|
    all_skill_names += [name]
  end
  return all_skill_names
end

def skill_pictures
  all_skill_logos = []
  ALL_SKILLS.each do |name, logo|
    all_skill_logos += [logo]
  end
  return all_skill_logos
end


puts "STARTING SEEDING PROCEDURES"

puts "USERS SKILLS"

FRONT_END_SKILLS.each do |name, logo|
  skill = Skill.create!(
    skill: name,
    photo: get_path(logo)
  )
end

BACKEND_SKILLS.each do |name, logo|
  skill = Skill.create!(
    skill: name,
    photo: get_path(logo)
  )
end

MOBILE_SKILLS.each do |name, logo|
  skill = Skill.create!(
    skill: name,
    photo: get_path(logo)
  )
end

puts 'CREATING USERS'

persons_urls = ["adele.jpg", "buscemi.jpg", "deniro.jpg", "ergogan.jpg", "hoffman.jpg",
  "prince.jpg", "putin.jpg", "seydou.jpg", "walken.jpg"]

10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "password123",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    skill_level: User::SKILL_LEVEL.sample,
    phone: Faker::PhoneNumber.cell_phone,
    photo: get_path1(persons_urls.sample),
    github_id: "github.com/" + Faker::Superhero.prefix.gsub(/\s+/, "") + Faker::Superhero.power.gsub(/\s+/, "") + ((1..1000).to_a.sample.to_s),
    address: "#{Faker::Address.street_address},#{Faker::Address.street_name+Faker::Address.city},#{Faker::Address.postcode}"
  )

  puts "CREATING PROJECTS"

  # PROJECTS

  company_logos_urls = company_logos
  company_index_list = (0..(COMPANY_NAMES.count - 1)).to_a

  3.times do
    company_index = company_index_list.sample
    statuses = ["Started", "Started", "Started", "Started","Completed"]
    deadline = rand(Date.today+21...Date.today+730)
    photos = [""]
    project = Project.create!(
      user_id: user.id,
      name: PROJECT_NAMES.sample,
      company_name: company_names[company_index],
      short_description: "Short description",
      deadline: deadline,
      # ADD IF STATEMENT BECAUSE ALL DATES ARE -14 days
      start_date: deadline - 14,
      status: statuses.sample,
      photo: Rails.root.join("app/assets/images/", get_path2(company_logos_urls[company_index])).open,
      description: PROJECT_DESC1.sample + " " + PROJECT_DESC2.sample,
    )

    puts 'CREATING POSITIONS ON PROJECTS'
    (2..7).to_a.sample.times do
      status = ["Filled", "Open", "Open"]

      # HAVE TO ADD $
      rate_cents = rand(5...40) * 500/100
      position = Position.create!(
        project: project,
        name: JOBS_DESCRIPTIONS.sample,
        rate_cents: rate_cents,
        status: status.sample,
        skill_level: User::SKILL_LEVEL.sample
      )
      puts "#{position.name} created"

      urls = skill_pictures
      # position_id = Project.first.id
      # project_no = Project.count

      1.times do
        PositionSkill.create!(
          position: position,
          skill: Skill.where(skill: FRONT_END_SKILLS.keys).to_a.sample,
          skill_type: "frontend"
        )
      end

      1.times do
        PositionSkill.create!(
          position: position,
          skill: Skill.where(skill: BACKEND_SKILLS.keys).to_a.sample,
          skill_type: "backend"
        )
      end

      1.times do
        PositionSkill.create!(
          position: position,
          skill: Skill.where(skill: MOBILE_SKILLS.keys).to_a.sample,
          skill_type: "mobile"
        )
      end
    end
  end
end
  #   puts "Project project.name created"
  # # GROUPS
  # (1..5).to_a.sample.times do
  #   group = Group.create!(
  #   user_id: user.id,
  #   name: Faker::Job.field,
  #   description: Faker::ChuckNorris.fact
  #   )
  #   puts "Group: group.name created"

  #   # GROUP MEMBERSHIPS
  #   puts 'creating GROUP MEMBERSHIPS'
  #   (3..5).to_a.sample.times do
  #     statuses = ["Pending", "Approved", "Approved"]
  #     category = "Member"
  #     group_membership = GroupMembership.create!(
  #     status: statuses.sample,
  #     category: category,
  #     user: User.all.sample,
  #     group_id: group.id
  #     )
  #     puts " GROUP MEMBERSHIP created"
  #   end

    # POSITIONS

# CREATING SKILLS

puts "CREATING SKILLS"

puts "FINISHED CREATING SKILLS"

# USERS APPLICATIONS
# puts 'CREATING 10 USERS...'
# urls = ["adele.jpg", "buscemi.jpg", "deniro.jpg", "ergogan.jpg", "hoffman.jpg",
#   "prince.jpg", "putin.jpg", "seydou.jpg", "walken.jpg"]
# 10.times do
#   user = User.create!(
#     email: Faker::Internet.email,
#     password: "123456",
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     photo: get_path1(urls.sample),
#     phone: Faker::PhoneNumber.cell_phone,
#     github_id: "github.com/" + Faker::Superhero.prefix.gsub(/\s+/, "") + Faker::Superhero.power.gsub(/\s+/, "") + ((1..1000).to_a.sample.to_s),
#     skill_level: User::SKILL_LEVEL.sample,
#     address: "#{Faker::Address.street_address},#{Faker::Address.street_name+Faker::Address.city},#{Faker::Address.postcode}"
#   )
#   puts "Created user: " + user.first_name + " " + user.last_name

User.all.each do |user|
  # USER_POSITION
  3.times do
    status = ["accepted", "declined", "pending"]
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


###################################################################
############          CUSTOM DATA FOR THE DEMO         ############
###################################################################


alex = User.create!({
  email: "alex-corrado@hotmail.com",
  password: "123456",
  first_name: "Alex",
  last_name: "Corrado",
  photo: nil,
  address: nil,
  phone: nil,
  rate_cents: 1500,
  linkedin_id: "7qB2qqMVwy",
  github_id: nil,
  skill_level: "Intermediate Programmer",
  linkedin_photo: "https://media.licdn.com/dms/image/C5103AQGqYLtVyGZwRg/profile-displayphoto-shrink_100_100/0?e=1533772800&v=beta&t=ha34IXk2HFWdFVKBgKK7aS-VIdxmFpFMAOVR0A14ZQM",
  linkedin_profile_url: "https://www.linkedin.com/in/alex-corrado-1602a65a"
})

francis = User.create!({
  email: "poitras.francis@gmail.com",
  password: "123456",
  first_name: "Francis",
  last_name: "Poitras",
  photo: nil,
  address: nil,
  phone: nil,
  rate_cents: 1500,
  linkedin_id: "rLovAv9Fdx",
  github_id: nil,
  skill_level: "Junior Programmer",
  linkedin_photo: "https://media.licdn.com/dms/image/C4E03AQGHVX3NFuFNww/profile-displayphoto-shrink_200_200/0?e=1533772800&v=beta&t=c3s6x2QKSsXIs09Y9kQyRSrsgXBLVVk3lsco4EKGgVk",
  linkedin_profile_url: "https://www.linkedin.com/in/francis-poitras/"
})

alexs_project = Project.create!({
  user: alex,
  name: "Front-End Dev Wanted",
  company_name: "Pizazz",
  short_description: "Need React.JS Developer for short-term contract",
  deadline: Date.today + 14.day,
  # ADD IF STATEMENT BECAUSE ALL DATES ARE -14 days
  start_date: Date.today,
  status: "Started",
  photo: Rails.root.join("app/assets/images/logos/comp_logos/Pizazz.png").open,
  description: "A long-term client wants to implement React.JS for dynamic webpages, and I struggle with that technology. Client is a growing housewares distributor in Ville St-Laurent",
})

# first position of alexs project

position_1 = Position.create!(
  project: alexs_project,
  name: "React.JS Developer",
  rate_cents: 150,
  status: "Open",
  skill_level: "Junior Programmer"
)

# three skills of that position

PositionSkill.create!(
  position: position_1,
  skill: Skill.find_by(skill: "React"),
  skill_type: "frontend"
)

PositionSkill.create!(
  position: position_1,
  skill: Skill.find_by(skill: "Javascript"),
  skill_type: "frontend"
)

PositionSkill.create!(
  position: position_1,
  skill: Skill.find_by(skill: "HTML"),
  skill_type: "frontend"
)

# And two users applying to that position

user_1 = User.create!(
  email: "mg@ayoub.com",
  password: "password123",
  first_name: "MG",
  last_name: "Ayoub",
  skill_level: "Junior Programmer",
  photo: Rails.root.join("app/assets/images/pictures/MG.jpg").open
)

user_position = UserPosition.create!(
  user: user_1,
  position: position_1,
  status: "pending",
  rate_cents: 180
)

user_2 = User.create!(
  email: "brett@middleton.com",
  password: "password123",
  first_name: "Brett",
  last_name: "Middleton",
  skill_level: "Junior Programmer",
  photo: Rails.root.join("app/assets/images/pictures/Brett.jpg").open
)

user_position = UserPosition.create!(
  user: user_2,
  position: position_1,
  status: "pending",
  rate_cents: 234
)

# second position to alexs project

position_2 = Position.create!(
  project: alexs_project,
  name: "Database Admin",
  rate_cents: 210,
  status: "Open",
  skill_level: "Junior Programmer"
)

# Two skills for the second position

PositionSkill.create!(
  position: position_2,
  skill: Skill.find_by(skill: "PostGres"),
  skill_type: "frontend"
)

PositionSkill.create!(
  position: position_2,
  skill: Skill.find_by(skill: "SQL"),
  skill_type: "frontend"
)

# And only one user applying to it

user_3 = User.create!(
  email: "jack@cookin.com",
  password: "password123",
  first_name: "Jack",
  last_name: "Gaarkeuken",
  skill_level: "Junior Programmer",
  photo: Rails.root.join("app/assets/images/pictures/Jack.jpg").open
)

user_position = UserPosition.create!(
  user: user_3,
  position: position_2,
  status: "pending",
  rate_cents: 234
)




