class AuthorSweeper < ActionController::Caching::Sweeper
  # observe Author

  # def after_save(data)
  #   expire_fragment(:controller => '#{record}', 
  #     :action => 'index', :action_suffix => 'author')
  # end

end