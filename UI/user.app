module UI/user

page showUser(u : User){
	bmain{
		pageHeader2{output(u.realname)}
		gridRow{
			gridSpan(10, 1){
				well{
					gridContainer(){
						gridSpan(5){
							horizontalForm("Information"){
								horizontalDescription {
									descriptionItem("name") { output(u.realname) }
									descriptionItem("username") { output(u.username) }

								}
							}
						}
						gridSpan(4){
						image("http://images.sodahead.com/polls/001719779/428970192_super_nerd_23_answer_2_xlarge.jpeg")
								// image("http://www.internetpoison.com/wp-content/uploads/2010/03/Zombie_Killer_by_benchi1.jpg")
						}
					}
					
					
				}
			}
		}
		
	}
}

access control rules {
	rule page showUser(u : User) {
		loggedIn()
	}
}