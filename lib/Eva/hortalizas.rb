class Hortalizas
attr_reader :nombre, :co2, :m2, :pvp, :coste
  include Enumerable
  def initialize(nombre, co2, m2, pvp, coste)
    @nombre = nombre
    @co2 = co2
    @m2 = m2
    @pvp = pvp
    @coste = coste
  end

  def to_s 
   "La hortaliza es #{@nombre}, tiene de emisiones #{@co2}, tiene de metros #{@m2}, tiene de pvp #{@pvp}, tiene de coste #{@coste}"
  end

  def each
    yield @nombre
    yield @co2
    yield @m2
    yield @pvp
    yield @coste
  end
end
