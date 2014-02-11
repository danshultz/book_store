class Appanage

  module ClassMethods

    def can(user, privilege)
      roles = user && user.roles
      Appanage.new(roles).send("can_#{privilege}")
    end

  end


  extend ClassMethods

  def initialize(roles)
    @roles = roles || []
  end


  def can_access_admin
    roles.detect { |r| r.name == 'admin' }
  end


  protected

    attr_reader :roles

end
