require 'rails_helper'

describe Person, type: :model do
  before(:each) do
    allow(Date).to receive(:today).and_return('15/12/2015'.to_date)
  end

  context 'associations' do
    it { is_expected.to belong_to :father }
    it { is_expected.to belong_to :mother }
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

  context 'Parent and children of person' do
    let!(:bo)     { create :father, first_name: 'Bo' }
    let!(:mother) { create :mother }
    let!(:haha)   { create(:person, first_name: 'HaHa', father: bo, mother: mother) }
    let!(:hehe)   { create(:person, first_name: 'Hehe') }

    describe '#parents' do
      it 'get parents' do
        haha_parents = haha.parents

        expect(haha_parents.count).to eq 2
        expect(haha_parents).to include bo.becomes(Person)
        expect(haha_parents).to include mother.becomes(Person)
      end
    end

    describe '#children' do
      it 'get children' do
        bo_children = bo.children

        expect(bo_children.count).to eq 1
        expect(bo_children.first.id).to eq haha.id
      end
    end
  end

  describe '#say_something' do
    let!(:haha)   { create(:person, first_name: 'HaHa', last_name: "Nguyen") }

    it 'return say hello' do
      expect(haha.say_something).to eq "Hello, my name HaHa Nguyen."
    end
  end
end
