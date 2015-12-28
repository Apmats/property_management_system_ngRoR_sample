require 'spec_helper'

describe PropertiesController do
  render_views
  describe "index" do
    before do
        Property.create!(name: 'Beautiful Villa', 
        description: 'A beautiful villa by the sea',
        address: 'Beach Ave. 75',
        property_type: 'Vacation',
        floor: 0)
        Property.create!(name: 'Great Apartment', 
        description: 'A beautiful apartment in the city',
        address: 'City Str. 75',
        property_type: 'City',
        floor: 5)
        Property.create!(name: 'Affordable Apartment', 
        description: 'An affordable apartment in the city',
        address: 'City Str. 80',
        property_type: 'City',
        floor: 4)

      xhr :get, :index, format: :json, keywords: keywords
    end

    subject(:results) { JSON.parse(response.body) }

    def extract_name
      ->(object) { object["name"] }
    end

    context "when the search finds results" do
      let(:keywords) { 'apartment' }
      it 'should 200' do
        expect(response.status).to eq(200)
      end
      it 'should return two results' do
        expect(results.size).to eq(2)
      end
      it "should include 'Great Apartment'" do
        expect(results.map(&extract_name)).to include('Great Apartment')
      end
      it "should include 'Affordable Apartment'" do
        expect(results.map(&extract_name)).to include('Affordable Apartment')
      end
    end

    context "when the search doesn't find results" do
      let(:keywords) { 'foo' }
      it 'should return no results' do
        expect(results.size).to eq(0)
      end
    end

  end
  
  
  describe "show" do
    before do
      xhr :get, :show, format: :json, id: property_id
    end

    subject(:results) { JSON.parse(response.body) }

    context "when the property exists" do
      let(:property) { 
        Property.create!(name: 'Affordable Apartment', 
        description: 'An affordable apartment in the city',
        address: 'City Str. 80',
        property_type: 'City',
        floor: 4)
      }
      let(:property_id) { property.id }

      it { expect(response.status).to eq(200) }
      it { expect(results["id"]).to eq(property.id) }
      it { expect(results["name"]).to eq(property.name) }
      it { expect(results["description"]).to eq(property.description) }
      it { expect(results["address"]).to eq(property.address) }
      it { expect(results["property_type"]).to eq(property.property_type) }
      it { expect(results["floor"]).to eq(property.floor) }
    end

    context "when the property doesn't exist" do
      let(:property_id) { -9999 }
      it { expect(response.status).to eq(404) }
    end
  end
end