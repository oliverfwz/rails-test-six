require 'rails_helper'

describe Child, type: :model do
  context 'associations' do
    it { is_expected.to belong_to :father }
    it { is_expected.to belong_to :mother }
  end

  describe '#parents' do
    let!(:father) { create :father }
    let!(:mother) { create :mother }
    let!(:haha) { create(:child, first_name: 'HaHa', father: father, mother: mother) }

    it 'get parents' do
      haha_parents = haha.parents

      expect(haha_parents.count).to eq 2
      expect(haha_parents).to include father.becomes(Person)
      expect(haha_parents).to include mother.becomes(Person)
    end
  end
end