require 'rails_helper'

describe Person, type: :model do
  before(:each) do
    allow(Date).to receive(:today).and_return('15/12/2015'.to_date)
  end

  context 'associations' do
    it { is_expected.to belong_to :father }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :dob }
    it { is_expected.to validate_presence_of :gender }
    it { is_expected.to enumerize(:gender).in(:male, :female) }
  end

  describe '#ensure_valid_age?' do
    let(:person) { build(:person) }

    context 'valid' do
      ['06/04/1990', '06/10/2000'].each do |dob|
        it "#{dob}" do
          person.dob = dob
          expect(person).to be_valid
        end
      end
    end

    context 'invalid' do
      ['06/04/2500', '06/10/2025'].each do |dob|
        it "#{dob}" do
          person.dob = dob
          expect(person).to_not be_valid
        end
      end
    end
  end

  describe '#name' do
    let!(:john) { create(:person, first_name: 'John', last_name: 'Nguyen') }

    it 'show full name' do
      john_name = john.name
      expect(john_name).to eq 'John Nguyen'
    end
  end
end
