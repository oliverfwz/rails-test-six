require 'rails_helper'

describe Mother, type: :model do
  context 'associations' do
    it { is_expected.to have_many :children }
  end

  context 'validations' do
    it { is_expected.to enumerize(:gender).in(:female) }
  end
end
