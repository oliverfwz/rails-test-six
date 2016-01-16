require 'rails_helper'

describe Father, type: :model do
  context 'associations' do
    it { is_expected.to have_many :children }
  end

  context 'validations' do
    it { is_expected.to enumerize(:gender).in(:male) }
  end
end
