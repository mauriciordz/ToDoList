=begin

Responsabilidad                                               Ruby code
Inicializar una lista vacía                                   list = List.new
Agregar una tarea a la lista                                  list.add(Task.new('Comprar chicles')
Parsear el archivo CSV e instancear clases de Ruby             ???

=end

require 'csv'

class Task
  attr_accessor :texto, :complete

  def initialize(tarea, complete = false)
    @texto = tarea
    @complete = complete
  end

end


class List
  attr_accessor :list, :texto

  def initialize
    @list = []
    index
  end

  def to_b(string)
    string == "true" ? true : false
  end

  def index
    CSV.foreach("Tareas.csv") do |tareaLinea|
     @list << Task.new(tareaLinea[0],to_b(tareaLinea[1]))
    end
    @list
  end

  def add(texto)
    nueva = Task.new(texto)
    @list << nueva
     CSV.open("Tareas.csv", "a+") do |csv|
      csv << [texto]
    end
    nueva
  end

  def delete(numero_tarea)
    borrar = @list.delete_at(numero_tarea-1)
    CSV.open("Tareas.csv", 'wb') do |csv|
      @list.each do |task| 
        csv << [task.texto,task.complete.to_s]
      end
    end
    borrar
  end

  def complete(tarea_cumplida)
    @list[tarea_cumplida-1].complete = true
    completo = @list[tarea_cumplida-1]
    CSV.open("Tareas.csv", 'wb') do |csv|
      @list.each do |task| 
        csv << [task.texto,task.complete.to_s]
      end
    end
    completo
  end



end

