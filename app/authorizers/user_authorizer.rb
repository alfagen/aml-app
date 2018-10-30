class UserAuthorizer < ApplicationAuthorizer
  def updatable_by?(operator)
    resource == operator || operator.administrator?
  end
end
