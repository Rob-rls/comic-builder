require 'rails_helper'

describe Comic, type: :model do

  it { should have_many(:comments) }
  it { should have_one(:strip) }

end
