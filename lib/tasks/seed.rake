namespace(:seed) {

  desc("creates basic seed data")
  task(:data => :environment) {
    5.times do |i|
      Book.create(
        :title => "book #{i}",
        :description => "The description",
        :price => 5.99,
        :cr_id => '123-123-123',
        :author => 'Dan'
      )
    end
  }


  desc("create default admin dev user")
  task(:user => :environment) {
    return if User.where(:email => "admin@example.com").exists?
    admin_role = Role.find_or_create_by(:name => 'admin')

    user = User.new(
      :email => "admin@example.com",
      :password => "password",
      :password_confirmation => "password",
      :roles => [admin_role]
    )
    user.skip_confirmation!
    user.save!
  }


  desc("resets basic seed data")
  task(:reset => :environment) {
    Book.delete_all
    User.delete_all
    Rake::Task["seed:data"].invoke
    Rake::Task["seed:user"].invoke
  }

}
