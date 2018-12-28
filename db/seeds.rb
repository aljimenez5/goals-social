arvi = User.create({:username => "Arvi", :email => "boy@email.com", :password => "banana"})

goal = Goal.create({:title => "Happiness", :content => "Be happy"})

arvi.goals << goal

step = Step.create({:content => "Smile more"})
step2 = Step.create({:content => "Surround yourself with loved ones"})
step3 = Step.create({:content => "Be thankful everyday"})
step4 = Step.create({:content => "Meditate"})

goal.steps << step
goal.steps << step2
goal.steps << step3
goal.steps << step4



luc = User.create({:username => "skywalker", :email => "skywalker@email.com", :password => "luke"})

another_goal = Goal.create({:title => "Food", :content => "Eat More"})

luc.goals << another_goal

luc_step = Step.create({:content => "Make a list of favorite foods"})
luc_step2 = Step.create({:content => "Plan your meals"})
luc_step3 = Step.create({:content => "Eat more carbs"})
luc_step4 = Step.create({:content => "A donut a day keeps the doctor away"})

another_goal.steps << luc_step
another_goal.steps << luc_step2
another_goal.steps << luc_step3
another_goal.steps << luc_step4
