module UI/templates
imports elib/lib
	define bmain() {
	  	includeCSS("bootstrap/css/bootstrap.css")
	  	includeCSS("bootstrap/css/bootstrap-responsive.css") 
	  	includeCSS("bootstrap/css/bootstrap-adapt.css")
	  	includeJS("jquery.js")
	    includeJS("bootstrap/js/bootstrap.js")
		
 
	    navigationbar    
	    gridContainer{  
	      	elements
		}
 	}

	define navigationbar() {    
	  	navbar{
	  		navigate root() [class="brand"] { "ZombieWebProto" }
	  		if(loggedIn()) {
	  			navItems {
	  				navItem {
	  					navigate showSurvivor(securityContext.principal.survivor) { "Survivor" } 
	  				}
	  				navItem {
	  					navigate showZombieKinds() { "Zombies" } 
	  				}
		  			if(securityContext.principal == admin){
		  				dropdownInNavbar("Admin"){
		  					dropdownMenu(){
		  						dropdownMenuItem(){ navigate buildWave() {"Wave"} }
		  						dropdownMenuItem(){ navigate showAllSurvivor() {"Survivors"} }
		  					}
		  				}
		  			}
	  			}
	  		}
	  		pullRight{
	  			navItems{
	  				signInOut
	  			}
	  		}
	  	}
	}
	
  	template signInOut() {
  		navItems{
	   		if(loggedIn()) {
		    	logout
	    	} else {
		    	navItem{
			   		navigate signin() { "Sign In" } 
        		}
        		navItem{
    	    		navigate registerUser() { "Sign Up" }
        		}
			}
  		}
	}
	
	page signin() {    
	 	bmain{      
	 		gridRow{ 
	 			gridSpan(12){ login } 
	 		}    
	 	}  
	}
	 
	 
	override template login() {
		var username : String;
	  	var pass : Secret;
	
	    action login(){
	    	securityContext.principal := null;
	      	validate(authenticate(username,pass), "Incorrect username or incorrect password");
	      	return root();
	    }
      	pageHeader2{ "Sign In" }
	  	horizontalForm{
			controlGroup("username") { input(username) }
		    controlGroup("Password") { input(pass) }
			formActions {
				submitlink login() [class="btn btn-primary"] { "Sign in" } " "
			}
	  	}
  	}
  	
  	page registerUser() {
  		var user := User{}
	  	var pass : Secret;
	
	    action register(){
	    	validate(user.password == pass, "The two passwords should be equal");
	    	var survivor := Survivor {
	    		attack := 50
	    		defence := 50
	    		healt := 100
	    		maxHealt := 100
	    		name := user.realname
	    		user := user
	    	};
	    	user.password := user.password.digest();
	    	user.save();
	    	return signin();
	    }
	    bmain{      
	 		gridRow{ 
	 			gridSpan(12){ 
	 				pageHeader2{ "Sign Up" }
				  	horizontalForm{
				  		controlGroup("name")	{ input(user.realname)}
						controlGroup("username") { input(user.username) }
					    controlGroup("Password") { input(user.password) }
					    controlGroup("Control Password") { input(pass) }
			
						formActions {
							submitlink register() [class="btn btn-primary"] { "Register" } " "
						}
				  	}
	 			} 
	 		}    
	 	}  
  	}

  	override template logout() {
	    action logout(){
	      securityContext.principal := null;
	      return root();
	    }
		navItem{	      
			navigate showUser(securityContext.principal) {"Logged in as " output(securityContext.principal.name)}
		}
		navItem{ submitlink logout() { "Log Out" } }
  	}


access control rules {
	rule page signin() {
		true
	}
	
	rule page registerUser() {
		true
	}
}

