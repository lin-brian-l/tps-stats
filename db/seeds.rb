# Blog entry content courtesy of veggieipsum.com.

content_for_entries = [
  { :title => "Salsify Taro Catsear Garlic",
    :body  => "Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini.",
    user: User.create(:username => "bambi", email: "lamchops@gmail.com", password: "password")},
  { :title => "Kohlrabi Radish Okra Azuki",
    :body  => "Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus winter purslane kale. ",
    user: User.create(:username => "steve", email: "steve@gmail.com", password: "heyyou")},
  { :title => "Lotus Root Water Spinach",
    :body  => "Celery potato scallion desert raisin horseradish spinach carrot soko. Lotus root water spinach fennel kombu maize bamboo shoot green bean swiss chard seakale pumpkin onion chickpea gram corn pea. ",
    user: User.create(:username => "jamie", email: "jj@gmail.com", password: "food")},
  { :title => "Bean Swiss Chard Seakale",
    :body  => "Nori grape silver beet broccoli kombu beet greens fava bean potato quandong celery. Bunya nuts black-eyed pea prairie turnip leek lentil turnip greens parsnip. Sea lettuce lettuce water chestnut eggplant winter purslane fennel azuki bean earthnut pea sierra leone bologi leek soko chicory celtuce parsley",
    user: User.create(:username => "alibaba", email: "al@gmail.com", password: "password")},
  { :title => "Magis Kohlrabi Welsh Onion",
    :body  => "Celery quandong swiss chard chicory earthnut pea potato. Salsify taro catsear garlic gram celery bitterleaf wattle seed collard greens nori. Grape wattle seed kombu beetroot horseradish carrot squash brussels sprout chard.",
  user: User.create(:username => "grace hopper", email: "gh@gmail.com", password: "idk")}]
#   { :title => "Bean Mustard Tigernut",
#     :body  => "Soko radicchio bunya nuts gram dulse silver beet parsnip napa cabbage lotus root sea lettuce brussels sprout cabbage. Catsear cauliflower garbanzo yarrow salsify chicory garlic bell pepper napa cabbage lettuce tomato kale arugula melon sierra leone bologi rutabaga tigernut."},
#   { :title => "Aubergine Spring Onion",
#     :body  => "Sea lettuce gumbo grape kale kombu cauliflower salsify kohlrabi okra sea lettuce broccoli celery lotus root carrot winter purslane turnip greens garlic. JÃ­cama garlic courgette coriander radicchio plantain scallion cauliflower fava bean desert raisin spring onion chicory bunya nuts."},
#   { :title => "Chicory Celtuce Parsley",
#     :body  => "Soko radicchio bunya nuts gram dulse silver beet parsnip napa cabbage lotus root sea lettuce brussels sprout cabbage. Catsear cauliflower garbanzo yarrow salsify chicory garlic bell pepper napa cabbage lettuce tomato kale arugula melon sierra leone bologi rutabaga tigernut. "},
#   { :title => "Coriander Yarrow Sweet Pepper",
#     :body  => "Water spinach arugula pea tatsoi aubergine spring onion bush tomato kale radicchio turnip chicory salsify pea sprouts fava bean. Dandelion zucchini burdock yarrow chickpea dandelion sorrel courgette turnip greens tigernut soybean radish artichoke wattle seed endive groundnut broccoli arugula."}
# ]



Entry.create!(content_for_entries)

