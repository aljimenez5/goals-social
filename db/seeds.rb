arvi = User.create({:username => "Arvi", :email => "boy@email.com", :password => "banana"})

goal = Goal.create({:content => "Be happy"})

arvi.goals << goal

step = Step.create({:content => "Smile more"})
step2 = Step.create({:content => "Surround yourself with loved ones"})
step3 = Step.create({:content => "Be thankful everyday"})
step4 = Step.create({:content => "Meditate"})

goal.steps << step
goal.steps << step2
goal.steps << step3
goal.steps << step4
