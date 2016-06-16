
require 'colorize'

class View

  def index(list)
    puts "*" * 25 + " Lista de Tareas " + "*" * 25
    list.each_with_index do |tarea, indice|
      puts tarea.complete ? "#{indice+1}.- [X] #{tarea.texto}" : "#{indice+1}.- [ ] #{tarea.texto}"
    #puts "#{indice+1}.- #{tarea.texto}" #la tarea en el Task lo devuelve como str en el @texto
    end
  end

  def add(task_nueva)
    puts "Agregaste la tarea: '#{task_nueva.texto}' a tu lista.".colorize(:green) 
  end

  def delete(task_borrar)
    puts "Eliminaste la tarea: '#{task_borrar.texto}' de tu lista.".colorize(:red)
  end

  def complete(task_completo,list)
    puts "Completaste la tarea: #{task_completo.texto}.".colorize(:cyan)
  end

  def menu
    ##Ciclo para imprimir menu
    puts ""
    puts "*".colorize(:yellow) * 25 + " To-Do List ".colorize(:yellow) + "*".colorize(:yellow) * 25 
    puts "Que quieres hacer? (teclea el número de la acción) ".colorize(:yellow)
    puts "1 .- Agregar una tarea".colorize(:yellow)
    puts "2 .- Eliminar una tarea".colorize(:yellow)
    puts "3 .- Marcar como terminada una tarea".colorize(:yellow)
    puts "4 .- Ver lista tareas".colorize(:yellow)
    puts "5 .- Para salir".colorize(:yellow)
    puts "*".colorize(:yellow) * 62
    puts ""
    caso = gets.chomp
    #todo.index
  end

  def get_data(caso)
    case caso
      when '1' 
        puts "Que tarea quieres agregar? (teclea el nombre de la tarea)  "
        nueva_tarea = gets.chomp
        system "clear"
        # @todo.add(nueva_tarea)
        nueva_tarea

      when '2' 
        puts "Que tarea quieres eliminar? (teclea el número de la tarea)"
        tarea_eliminada = gets.chomp.to_i
        system "clear"
        # @todo.delete(tarea_eliminada)
        tarea_eliminada

      when '3' 
        # system "clear"
        puts "Que tarea quieres marcar como terminada? (teclea el número de la tarea) "
        tarea_marcada = gets.chomp.to_i
        # @todo.complete(tarea_marcada)
        tarea_marcada

      when '4'
        system "clear"
        puts "Esta es tu lista de tareas..."
        # @todo.index
        caso   

      when '5'
        puts "Gracias por usar la aplicación!!!"
        
      else 
        puts "Vuelve a poner un numero del 1 al 5"
        caso
    end
  end

end
