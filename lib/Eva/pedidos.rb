class Pedido

 def initialize(nombre_pedido, &block)
   @nombre_pedido = nombre_pedido
   @ingredientes = []
   @especificaciones = []
   if block_given?
     if block.arity == 1
       yield self
     else
       instance_eval(&block)
     end
   end
 end

 def producto (fruta, info = {})
   output = "[#{info[:peso]}]" if info[:peso]
   output << "#{fruta.nombre} - #{fruta.co2} - #{fruta.pvp}"

   @ingredientes << output
   
   output
 end

 def especificaciones (info = {})
   output = "#{info[:tiempo]}" if info[:tiempo]
   
   @especificaciones << output

   output
 end

 def to_s
  output = @nombre_pedido

  output << "\n#{'=' * @nombre_pedido.size}\n"
  output << "Productos:\n"

  @ingredientes.each do |producto|
    output << producto + "\n"
  end

  output << "\nEspecificaciones:\n"
  @especificaciones.each_with_index do |especificacion, index|
    output << "#{index + 1}) #{especificacion}\n"
  end

  output
  end
end
