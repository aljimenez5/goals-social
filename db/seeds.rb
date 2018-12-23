arvi = User.create({:username => "Arvi", :email => "boy@email.com", :password => "banana"})

goal = Goal.create({:content => "Be happy"})

arvi.goals << goal
