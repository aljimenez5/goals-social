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


someboy = User.create({:username => "Illy", :email => "illy@email.com", :password => "someone"})

more_goal = Goal.create({:title => "Hunger", :content => "Stop being hungry all the time"})

someboy.goals << more_goal

some_step = Step.create({:content => "Eat smaller meals more frequently"})
some_step2 = Step.create({:content => "Do not overeat"})
some_step3 = Step.create({:content => "Drink water"})

more_goal.steps << some_step
more_goal.steps << some_step2
more_goal.steps << some_step3


somegirl = User.create({:username => "mini", :email => "mini@email.com", :password => "someoneelse"})

g_goal = Goal.create({:title => "Sports", :content => "Become more active"})

somegirl.goals << g_goal

g_step = Step.create({:content => "Walk more often"})
g_step2 = Step.create({:content => "Find local leagues"})
g_step3 = Step.create({:content => "Find afterwork teams"})

g_goal.steps << g_step
g_goal.steps << g_step2
g_goal.steps << g_step3
