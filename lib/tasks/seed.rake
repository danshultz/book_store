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

  desc("resets basic seed data")
  task(:reset => :environment) {
    Book.delete_all
    Rake::Task["seed:data"].invoke
  }

}
