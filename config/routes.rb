Rails.application.routes.draw do

  # Routes for the Cardio resource:

  # CREATE
  post("/insert_cardio", { :controller => "cardios", :action => "create" })
          
  # READ
  get("/cardios", { :controller => "cardios", :action => "index" })
  
  get("/cardios/:path_id", { :controller => "cardios", :action => "show" })
  
  # UPDATE
  
  post("/modify_cardio/:path_id", { :controller => "cardios", :action => "update" })
  
  # DELETE
  get("/delete_cardio/:path_id", { :controller => "cardios", :action => "destroy" })

  #------------------------------

  # Routes for the Weight resource:

  # CREATE
  post("/insert_weight", { :controller => "weights", :action => "create" })
          
  # READ
  get("/weights", { :controller => "weights", :action => "index" })
  
  get("/weights/:path_id", { :controller => "weights", :action => "show" })
  
  # UPDATE
  
  post("/modify_weight/:path_id", { :controller => "weights", :action => "update" })
  
  # DELETE
  get("/delete_weight/:path_id", { :controller => "weights", :action => "destroy" })

  #------------------------------

  # Routes for the Exercise resource:

  # CREATE
  post("/insert_exercise", { :controller => "exercises", :action => "create" })
          
  # READ
  get("/exercises", { :controller => "exercises", :action => "index" })
  
  get("/exercises/:path_id", { :controller => "exercises", :action => "show" })
  
  # UPDATE
  
  post("/modify_exercise/:path_id", { :controller => "exercises", :action => "update" })
  
  # DELETE
  get("/delete_exercise/:path_id", { :controller => "exercises", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "users", :action => "new_registration_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "users", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "users", :action => "edit_registration_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "users", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "users", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_sessions", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_sessions", :action => "destroy_cookies" })
             
  #------------------------------
  # HOME PAGE
  get("/", { :controller => "application", :action => "home_page" })
   get("/about", { :controller => "application", :action => "home_page" })






  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
