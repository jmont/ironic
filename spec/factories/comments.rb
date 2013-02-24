FactoryGirl.define do
  factory :comment do
    txt {['OMG lol',
          'WAT',
          'What is thisssss',
          'Que cosa',
          'I WAS WAITING FOR THIS',
          'ERMAGERD'].sample}

  end
end