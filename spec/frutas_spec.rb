RSpec.describe Eva do
  describe Frutas do
    before :each do
	    @mandarina = Frutas.new("Mandarina", 0.5, 20.0, 10.0, 5.0, "Agrio", "Regadío", "cuadricula", 50.2)
	    @platano = Frutas.new("Plátano",0.2,5.4,0.1,8.9, "Dulce", "Regadio", "cuadricula",8.0)
	    @viña = Frutas.new("Viña", 0.4, 20.0, 2.20, 5.95, "Viña", "Secano", "cuadricula", 80.2)
	    @peral = Frutas.new("Peral", 0.4, 20.0, 0.80, 7.53, "Fruta Dulce", "Regadio", "tresbolillo", 74.2)
	    @tanda = [@mandarina, @platano, @viña, @peral]
    end
  
  it "Se debe instaciar una fruta" do
	  expect(Frutas.new("Mandarina", 0.5, 20.0, 10.0, 5.0, "Agrio", "Regadío", "cuadricula",50.2)).not_to eq(nil)
  end

  it "Se debe obtener un método con el nombre de la fruta" do
	  expect(Frutas.new("Mandarina",0.5,20.0,10.0,5.0, "Agrio", "Regadío","cuadricula",50.2).nombre).to eq("Mandarina")
  end

  it "Se debe obtener un método con el nombre de la fruta 2" do
    expect(@mandarina.nombre).to eq("Mandarina")
  end

  it "emisiones" do
    expect(@mandarina.co2).to eq(0.5)
  end

  it "Se espera que una instancia de la clase Frutas, sea una fruta" do
    expect(@mandarina.instance_of? Frutas).to eq(true)
  end

  it "Se espera que una instancia de la clase Frutas, sea una fruta" do
	  expect(Frutas.new("Plátano",0.2,5.4,0.1,8.9, "Dulce", "Regadio","cuadricula",50.2).instance_of? Frutas).to eq(true)
  end

  it "Se espera que una instancia de la clase Frutas sea un Cultivo" do
    expect(@mandarina.is_a? Cultivo).to eq(true)
  end

  it "Se espera que la clase Frutas tenga el comparable" do
    expect(@mandarina.is_a? Comparable).to eq(true)
  end

  it "No se espera que tenga Numeric" do
    expect(@mandarina.is_a? String).not_to eq(true)
  end

  it "No se espera que tenga String" do
    expect(@mandarina.is_a? Numeric).to eq(false)
  end

  it "Se debe de obtener el sabor de la fruta" do
    expect(@mandarina.sabor).to eq("Agrio")
  end

  it "Se debe obtener si es de regadío o secano" do
    expect(@mandarina.tipo).to eq("Regadío")
  end

  it "Se debe poder ser comparable el coste de producción" do
    expect(@mandarina > @platano).to eq(false)
  end

  it "Se debe poder se comparable el coste de producción" do
    expect(@mandarina == @platano).to eq(false)
  end

  it "Se debe poner la cantidad de plantas" do
    expect(@mandarina.numPlantas(4.0)).to eq(15.87276392438215)
  end

  it "Dada el numero de arboles" do
    expect(@mandarina.terreno(400.0)).to eq(1008016)
  end

  it "Dada la fecha de siembra se debe estimar la fecha de cosecha" do
    expect(@mandarina.fechacosecha(Time.new(2021,01,24))).to eq(Time.new(2021,03,25))
  end
  
  it "Que frutal tiene el coste más bajo y qué valor" do
    expect(@tanda.min).to eq(@mandarina)
    expect(@tanda.min.coste).to eq(5.0)
  end

  it "Que frutal ocupa la mayor parte de terreno y su valor" do
	  expect(@tanda.max_by {|n| n.terreno(100.0)}).to eq(@viña)
  end
  it "valor de fruta que ocupa mayor parte de terreno" do
	  expect(@tanda.max_by {|x| x.terreno(100.0)}.terreno(100.0)).to eq(643204)
  end

  it "ultimo" do
    expect(@tanda.select{|x| x.sabor == "Fruta dulce" and x.tipo == "Regadio"}.map {|y| y.numPlantas(1)}).to eq([])
  end

  it "enumerable" do
	  expect(@mandarina.each{|n| "#{n}"}).to eq("Agrio")
  end

  it "enumerable módulo" do
    expect(@mandarina.is_a? Enumerable).to eq(true)
  end

  it "metodo singlenton" do
    fresa = Frutas.new("Fresa", 0.5, 20.0, 10.0, 5.0, "Agrio", "Regadío", "cuadricula", 50.2)
    def fresa.saborfresa (saborcito)
      sabor + saborcito
    end
    expect(fresa.saborfresa("dulce")).to eq("Agriodulce")
 end
  it "metodo singlenton 2" do
    naranja = Frutas.new("Naranja", 0.5, 20.0, 10.0, 5.0, "Agrio", "Regadío", "cuadricula", 50.2)
    def naranja.precios (precios)
      coste + precios
    end
    expect(naranja.precios(50)).to eq(55.0)
  end
 end
end 
