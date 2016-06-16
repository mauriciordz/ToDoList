require_relative 'Modelo'
require_relative 'View'

class ToDo
  def initialize()
    @lista = List.new
    @vista = View.new
    loop do
      opcion = @vista.menu
      
      case opcion
        when '1'
          data = @vista.get_data(opcion)
          add(data)
        when '2'
          data = @vista.get_data(opcion)
          delete(data)
        when '3'
          index
          data = @vista.get_data(opcion)
          complete(data)
        when '4' 
          index
        when '5'
          exit 
      end
    end
  end

  def index
    @vista.index(@lista.list)
  end

  def add(texto)
    @vista.add(@lista.add(texto))
  end

  def delete(numero_tarea)
    @vista.delete(@lista.delete(numero_tarea))
  end

  def complete(tarea_cumplida)
    p tarea_cumplida
    @vista.complete(@lista.complete(tarea_cumplida),@lista.list)
  end

end

todo = ToDo.new

