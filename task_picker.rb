def task_picker
  team = [ "Alex le Magnifique",  "Vassanth the Brave", "Francis"]
  team.sample
end

p "And the winner is #{task_picker}"
