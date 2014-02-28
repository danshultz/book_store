class Order < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :books
  scope :by_user, ->(user) { where(:user => user) }

  def total
    books.reduce(0) { |sum, book| sum += book.price }
  end

end
