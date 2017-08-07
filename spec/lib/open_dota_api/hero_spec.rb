require 'spec_helper'

describe OpenDotaApi::Hero do
  let(:id) { 1 }
  let(:name) { 'npc_dota_hero_antimage' }
  let(:localized_name) { 'Anti-Mage' }
  let(:primary_attr) { 'agi' }
  let(:attack_type) { 'Melee' }
  let(:roles) { %w[Carry Escape Nuker] }
  let(:legs) { 2 }

  let(:heroes_file) { File.read('spec/data/heroes.json') }
  let(:response_json) { JSON.parse(heroes_file) }
  let(:heroes) { OpenDotaApi::Hero.instantiate(response_json) }
  let(:hero) { heroes.first }

  it 'returns endpoint' do
    expect(described_class::ENDPOINT).to eq 'heroes'
  end

  it 'inherits entity object' do
    expect(hero).to be_a OpenDotaApi::Entity
  end

  it 'is instantiable' do
    expect(hero).to be_a OpenDotaApi::Entities::Instantiatable
  end

  describe 'default attributes' do
    it 'returns id' do
      expect(hero.id).to eq id
    end

    it 'returns name' do
      expect(hero.name).to eq name
    end

    it 'returns localized name' do
      expect(hero.localized_name).to eq localized_name
    end

    it 'returns primary attribute' do
      expect(hero.primary_attr).to eq primary_attr
    end

    it 'returns attack type' do
      expect(hero.attack_type).to eq attack_type
    end

    it 'returns roles' do
      expect(hero.roles).to eq roles
    end

    it 'returns legs' do
      expect(hero.legs).to eq legs
    end
  end
end
