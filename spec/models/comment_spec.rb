require 'spec_helper'

describe Comment, type: :model do

  it { should belong_to(:comic) }

end
