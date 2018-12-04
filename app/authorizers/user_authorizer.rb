class UserAuthorizer < ApplicationAuthorizer
  def self.creatable_by?(user)
    user&.aml_operator&.administrator?
  end

  def updatable_by?(user)
    resource == user || user&.aml_operator&.administrator?
  end
end
