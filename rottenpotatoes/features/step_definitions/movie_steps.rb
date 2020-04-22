# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.new(movie).save
  end
  # fail "Unimplemented"
end

Then /(.*) seed movies should exist/ do | n_seeds |
  Movie.count.should be n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  expect(/[\s\S]*#{e1}[\s\S]*#{e2}/).to match(page.body)
  # fail "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  ratings = rating_list.split(", ")
  ratings.each do |s|
    if uncheck
      uncheck("ratings[#{s}]")
    else 
      check("ratings[#{s}]")
    end
  end
  # fail "Unimplemented"
end

Then /I should see all the movies/ do
  movie = Movie.all.count
  expect(movie).to eq 10
  # fail "Unimplemented"
end
