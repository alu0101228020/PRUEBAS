require "./lib/Eva/cultivo"

class Frutas < Cultivo
  include Comparable
  include Enumerable
  attr_reader :sabor, :tipo, :marco, :distancia
  def initialize(nombre, co2, m2, pvp, coste, sabor, tipo, marco, distancia)
    super(nombre,co2,m2,pvp,coste)
    @sabor = sabor
    @tipo = tipo
    @marco = marco
    @distancia = distancia
  end

  def <=> (other)
    return nil unless other.instance_of? Frutas
    self.coste <=> other.coste
  end

  def numPlantas(hec)
    if @marco == "cuadricula"
	    return ((hec * 10000) / (distancia ** 2))
    elsif @marco == "Tresbolillo"
	    return ((hec *10000) / (distancia ** 2 * 0.866))
    end
  end

  def terreno(cantidad)
    if @marco == "cuadricula"
	    return (cantidad * (distancia ** 2)).floor
    elsif @marco == "tresbolillo"
	    return (cantidad * (distancia ** 2) * 0.866).floor
    end
  end

  def fechacosecha(tiempo)
    ciclo = 60
    tiempo + (ciclo * 86400)
  end
  
  def each
    yield @nombre
    yield @co2
    yield @m2
    yield @pvp
    yield @coste
    yield @sabor
  end
end
