require 'rails_helper'

describe Father, type: :model do
  context 'associations' do
    it { is_expected.to have_many :children }
  end

  context 'validations' do
    it { is_expected.to enumerize(:gender).in(:male) }
  end

  describe '#say_something' do
    let!(:bo)     { create :father, first_name: 'Bo' }
    let!(:haha)   { create(:person, first_name: 'HaHa', father: bo) }

    it 'show say_something' do
      expect(haha.father.say_something).to eq "Hello, I am your father."
    end
  end
end
