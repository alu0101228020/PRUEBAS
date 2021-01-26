RSpec.describe Eva do
  describe Hortalizas do
    before :each do
    end
  
    it "Se debe poder instanciar una hortaliza" do
      expect(Hortalizas.new()).not_to eq(nil)
    end

  end
end
