require 'factory_girl'
Dir[Rails.root.join("spec/factories/*.rb")].each {|f| require f}

15.times do
  c = FactoryGirl.create :confession

  10.times do
    comment = FactoryGirl.create :comment
    comment.confession = c
    comment.save
  end
end