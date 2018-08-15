require 'rails_helper'

RSpec.describe Category, type: :model do

  it { should have_many(:filters) }

  it { should have_many(:articles).through(:filters) }

end