FactoryGirl.define do
  factory :confession do
    txt {['Found Glasses, Houston Hall',
          'Lost: Black hooded Northface jacket',
          'For Sale: MacBook case - blue $10',
          'Wanted: Canon AE-1 Program Film Camera 50mm lens',
          'For Sale: Tube mic Preamp',
          'Emancipator tickets for sale'].sample}

  end
end