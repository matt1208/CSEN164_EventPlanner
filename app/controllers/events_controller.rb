class EventsController < ApplicationController
  # Restrict actions to logged-in users except browsing the index and show pages
  before_action :require_user, except: [:index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :require_creator, only: [:edit, :update, :destroy]

  # GET /events (Includes Search and Filtering)
  def index
    @events = Event.all

    if params[:category_id].present?
      @events = @events.where(category_id: params[:category_id])
    end

    if params[:start_date].present?
      @events = @events.where("date >= ?", params[:start_date])
    end
  end

  # GET /events/:id
  def show
    @comment = Comment.new
    # Check if the current logged-in user is already registered for this event
    @current_user_registration = current_user.registrations.find_by(event_id: @event.id) if logged_in?
  end

  # GET /events/new
  def new
    @event = current_user.events.build
  end

  # POST /events
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event, notice: "Your event was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /events/:id/edit
  def edit
  end

  # PATCH/PUT /events/:id
  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event updates saved successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /events/:id
  def destroy
    @event.destroy
    redirect_to events_path, notice: "The event was successfully canceled and removed."
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :date, :location, :category_id)
  end

  def require_creator
    unless @event.user == current_user || current_user&.admin?
      redirect_to events_path, alert: "Access Denied: You can only manage events you created."
    end
  end
end