require 'test_helper'

class Evento
  def self.create_example(params = Hash.new)
    example = Evento.new(
      :tipo => params[:tipo] || "Show",
      :local => params[:local] || "ThePub",
      :custo => params[:custo] || 15.00,
      :data => params[:data] || Time.now
    )
    example.save
    return example
  end
end

class EventoTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "Get The Next Event by date" do
    first = Evento.create_example
    first.save
    second = Evento.create_example
    second.save
    assert first.next == second
    assert Evento.next_by_id(first._id) == second

  end

  test "Creates and Save a new evento" do
    evento = Evento.new
    evento.tipo = "Show"
    evento.local = "ThePub Rock Bar"
    evento.custo = 15.00
    evento.data = Time.now
    assert evento.save
  end
end
