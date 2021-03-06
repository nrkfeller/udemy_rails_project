class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_member!, :except =>[:index, :show]
  #before_action :authenticate_member!, :only =>[:new, :edit, :create, :update, :destroy]

  respond_to :html

  def index
    @events = Event.all
    respond_with(@events)
  end

  def show
    @comments = Comment.where(event_id: params[:id])
    respond_with(@event)
  end

  def new
    @event = Event.new
    respond_with(@event)
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.save
    respond_with(@event)
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date, :description)
    end
end
