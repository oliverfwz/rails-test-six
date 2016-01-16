require 'rails_helper'

describe Mother, type: :model do
  context 'associations' do
    it { is_expected.to have_many :children }
  end

  context 'validations' do
    it { is_expected.to enumerize(:gender).in(:female) }
  end

  describe '#say_something' do
    let!(:mimi)     { create :mother, first_name: 'mimi' }
    let!(:haha)   { create(:person, first_name: 'HaHa', mother: mimi) }

    it 'show say_something' do
      expect(haha.mother.say_something).to eq "Hello, I am your mother."
    end
  end
end
