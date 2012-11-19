module UI/templates
imports elib/bootstrap/bootstrap
	define bmain() {
  	
	    includeCSS("adapt.css")
	    includeCSS("bootstrap-extension.css")
	  	includeCSS("bootstrap/css/bootstrap.css")
	    includeJS("jquery.js")
	    includeJS("bootstrap/js/bootstrap.js")
	    includeJS("feedback.js")
		
 
	    navigationbar    
	    gridContainer{ 
	      	elements
		}
 	}

	define navigationbar() {    
	  	navbar{
	  		navigate root() [class="brand"] { "ZombieWebProto" }
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
    	    		// navigate registerUser() { "Sign Up" }
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
		var username : Email;
	  	var pass : Secret;
	
	    action login(){
	    	securityContext.principal := null;
	      	validate(authenticate(username,pass), "Incorrect email address or incorrect password");
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

  override template logout() {
    action logout(){
      securityContext.principal := null;
      return root();
    }
	  navItem{	      
	    navigate root() {"Logged in as " output(securityContext.principal.name)}
	  }
	  navItem{ submitlink logout() { "Log Out" } }
  }

	 

