RSpec.describe Eva do
  describe Pedido do
    before :each do
    @mercado = Pedido.new("Mercado") do
      producto Frutas.new("Mandarina", 0.5, 20.0, 10.0, 5.0, "Agrio", "Regadío", "cuadricula", 50.2), :peso => "50 kilos"
      producto Frutas.new("Plátano",0.2,5.4,0.1,8.9, "Dulce", "Regadio", "cuadricula",8.0), :peso => "100 kilos"
     
      especificaciones :tiempo => "El tiempo es un año"
      especificaciones :tiempo => "El tiempo es un mes"
    end
    end

   it "Producto" do
     expect(@mercado.producto(Frutas.new("Mandarina", 0.5, 20.0, 10.0, 5.0, "Agrio", "Regadío", "cuadricula", 50.2), :peso => "50 kilos")).to eq("[50 kilos]Mandarina - 0.5 - 10.0")
   end

   it "Especificaciones" do
     expect(@mercado.especificaciones(:tiempo => "El tiempo es un año")).to eq("El tiempo es un año")
   end

   it "to_s" do
     expect(@mercado.to_s).to eq("Mercado\n=======\nProductos:\n[50 kilos]Mandarina - 0.5 - 10.0\n[100 kilos]Plátano - 0.2 - 0.1\n\nEspecificaciones:\n1) El tiempo es un año\n2) El tiempo es un mes\n")
   end
 end
end
