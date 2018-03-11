# players = [
#   { :gamer_tag => "metroid",
#     :sponsor => "" },
#   { :gamer_tag => "Nave",
#     :sponsor => "" },
#   { :gamer_tag => "Kels",
#     :sponsor => "GHQ" },
#   { :gamer_tag => "DrugFreeChu",
#     :sponsor => "" }
# ]

# Player.create!(players)

# tournament = {
#   :name => "Tri-point Smash 1",
#   :date => "3/2/18",
#   :link => "https://smash.gg/tournament/tripoint-smash-1"
# }

# Tournament.create(tournament)

# tournament_attendee = {
#   tournament_id: 1,
#   media: false,
#   spectator: false,
#   competitor: true,
#   facilitator: false
# }

# Player.all.each do |player| 
#   TournamentAttendee.create(tournament_attendee)
#   player.attended_tournaments << TournamentAttendee.last
# end

# events = [
#   { name: "Melee Singles" }, { name: "Project M Singles" }
# ]

# events.each do |event|
#   Event.create(event)
#   Tournament.first.events << Event.last
# end

# Player.all.each do |player|
#   Event.all.each do |event| 
#     EventEntrant.create();
#     event.event_entrants << EventEntrant.last
#     player.entered_events << EventEntrant.last
#   end
# end

# Blog entry content courtesy of veggieipsum.com.

# content_for_entries = [
#   { :title => "Salsify Taro Catsear Garlic",
#     :body  => "Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini."},
#   { :title => "Kohlrabi Radish Okra Azuki",
#     :body  => "Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus winter purslane kale. "},
#   { :title => "Lotus Root Water Spinach",
#     :body  => "Celery potato scallion desert raisin horseradish spinach carrot soko. Lotus root water spinach fennel kombu maize bamboo shoot green bean swiss chard seakale pumpkin onion chickpea gram corn pea. "},
#   { :title => "Bean Swiss Chard Seakale",
#     :body  => "Nori grape silver beet broccoli kombu beet greens fava bean potato quandong celery. Bunya nuts black-eyed pea prairie turnip leek lentil turnip greens parsnip. Sea lettuce lettuce water chestnut eggplant winter purslane fennel azuki bean earthnut pea sierra leone bologi leek soko chicory celtuce parsley"},
#   { :title => "Magis Kohlrabi Welsh Onion",
#     :body  => "Celery quandong swiss chard chicory earthnut pea potato. Salsify taro catsear garlic gram celery bitterleaf wattle seed collard greens nori. Grape wattle seed kombu beetroot horseradish carrot squash brussels sprout chard."},
#   { :title => "Parsley Shallot Courgette Tatsoi",
#     :body  => "Beetroot water spinach okra water chestnut ricebean pea catsear courgette summer purslane. Water spinach arugula pea tatsoi aubergine spring onion bush tomato kale radicchio turnip chicory salsify pea sprouts fava bean. "},
#   { :title => "Bean Mustard Tigernut",
#     :body  => "Soko radicchio bunya nuts gram dulse silver beet parsnip napa cabbage lotus root sea lettuce brussels sprout cabbage. Catsear cauliflower garbanzo yarrow salsify chicory garlic bell pepper napa cabbage lettuce tomato kale arugula melon sierra leone bologi rutabaga tigernut."},
#   { :title => "Aubergine Spring Onion",
#     :body  => "Sea lettuce gumbo grape kale kombu cauliflower salsify kohlrabi okra sea lettuce broccoli celery lotus root carrot winter purslane turnip greens garlic. JÃ­cama garlic courgette coriander radicchio plantain scallion cauliflower fava bean desert raisin spring onion chicory bunya nuts."},
#   { :title => "Chicory Celtuce Parsley",
#     :body  => "Soko radicchio bunya nuts gram dulse silver beet parsnip napa cabbage lotus root sea lettuce brussels sprout cabbage. Catsear cauliflower garbanzo yarrow salsify chicory garlic bell pepper napa cabbage lettuce tomato kale arugula melon sierra leone bologi rutabaga tigernut. "},
#   { :title => "Coriander Yarrow Sweet Pepper",
#     :body  => "Water spinach arugula pea tatsoi aubergine spring onion bush tomato kale radicchio turnip chicory salsify pea sprouts fava bean. Dandelion zucchini burdock yarrow chickpea dandelion sorrel courgette turnip greens tigernut soybean radish artichoke wattle seed endive groundnut broccoli arugula."}
# ]

# Entry.create!(content_for_entries)

# user_info = [
#   {username: "brian", email: "brian@broccoli.com", password: "briann"},
#   {username: "donald", email: "donald@broccoli.com", password: "donald"},
#   {username: "qiu", email: "qiu@broccoli.com", password: "qiuuuu"},
#   {username: "peter", email: "peter@broccoli.com", password: "peterr"},
#   {username: "pat", email: "pat@broccoli.com", password: "patttt"},
# ]

# User.create!(user_info)

# User.all.each_with_index do |user, index|
#   user.entries << Entry.find(index + 1)
#   user.entries << Entry.find(index + 6)
# end
