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

class EventosControllerTest < ActionController::TestCase
  test "should get index" do
    Evento.create_example
    get :index
    assert_response :success
  end

  test "should be tracked" do
    assert_difference('Track.count') do
      get :index
    end
    assert Track.last.action == 'index'
  end
  test "should see an evento in index" do
   Evento.create_example
   get :index
    assert @response.body.match(/ThePub/)!=nil
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get new form" do
    get :new
    assert @response.body.match(/form/)!=nil
    assert_response :success
  end

  test "should get the next event by date" do
    first = Evento.create_example
    first.save
    second = Evento.create_example(:local => "Orbita")
    second.save
    get :next ,:id => first._id.to_s
    assert @response.body.match(/Orbita/)
    assert_response :success
  end

  test "should create an evento" do
    assert_difference('Evento.count') do
      post :create, :evento => {
        :tipo => "Show",
        :local => "ThePub Rock Bar",
        :custo => 15.00,
        :data => Time.now
      }
    end
    assert @response.body.match(/Evento Criado/)!=nil
    assert_response :success
  end
  
  test "Should get into an specific event" do
    get :show , :id => Evento.last.id.to_s
    assert @response.body.match(Evento.last.local)!=nil
    assert_response :success
  end

  test "should get vou" do
    get :vou , :id => Evento.last.id.to_s
    assert_response :success
  end
  test "should show how many people go to evento" do
    get :show , :id=> Evento.last.id.to_s
    assert @response.body.match('Quantos vao: '+Evento.last.quantos_vao?.to_s)!=nil
  end
  test "should complete vou and change number" do
    assert_difference('Evento.last.quantos_vao?') do
      get :vou , :id => Evento.last.id.to_s
    end
    assert_response :success
  end
  test "should create a session_id" do
    get :index
    assert Track.last.session_id != nil
  end

end
