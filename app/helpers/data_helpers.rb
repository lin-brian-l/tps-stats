def reverse_tournament_date(array)
  array.sort_by { |element| element.tournament.date }.reverse
end

def return_tables_hash()
  {
    "Tournament": Tournament,
    "Player": Player,
    "Event": Event,
    "EventEntrant": EventEntrant,
    "Phase": Phase,
    "Group": Group,
    "Match": Match
  }
end

def percent(num1, num2)
  (num1.to_f / num2.to_f * 100).round(1)
end