RSpec.describe Eva do
  describe Hortalizas do
    before :each do
	    @lechuga = Hortalizas.new("Lechuga", 0.4, 20.0, 2.5, 0.5)
    end
  
    it "Se debe poder instanciar una hortaliza" do
	    expect(Hortalizas.new("Lechuga", 0.4, 20.0, 2.5, 0.5)).not_to eq(nil)
    end

    it "Se debe poder tener un nombre en hortaliza" do
      expect(@lechuga.nombre).to eq("Lechuga")
    end

    it "Se debe poder tener emisiones en hortaliza" do
      expect(@lechuga.co2).to eq(0.4)
    end

    it "Se debe poder tener metros en hortaliza" do
      expect(@lechuga.m2).to eq(20.0)
    end

    it "Se debe poder tener pvv en hortaliza" do
      expect(@lechuga.pvp).to eq(2.5)
    end

    it "Se debe poder tener coste en hortaliza" do
      expect(@lechuga.coste).to eq(0.5)
    end

    it "Se debe obtener la información formateada" do
      expect(@lechuga.to_s).to eq("La hortaliza es Lechuga, tiene de emisiones 0.4, tiene de metros 20.0, tiene de pvp 2.5, tiene de coste 0.5")
    end

    it "enumerable" do
	    expect(@lechuga.each{|i| "#{i}"}).to eq("0.5")
    end
  end
end
