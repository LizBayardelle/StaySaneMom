class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /people
  # GET /people.json
  def index
    @people_last_name = Person.where(user_id: current_user.id).order("last_name ASC")
    @people_birthday = Person.where(user_id: current_user.id).where.not(birthday: nil).sort_by{ |b| [b.birthday.month, b.birthday.day]}
    @people_no_birthday = Person.where(user_id: current_user.id, birthday: nil).order("last_name ASC")
    @relationships = Person.where(user_id: current_user.id).map(&:relationship).uniq
    @groups = Person.where(user_id: current_user.id).where.not(group: nil).map(&:group).uniq
    @people_no_group = Person.where(user_id: current_user.id, group: nil).order("last_name ASC")
    @person = Person.new
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)
    @person.user_id = current_user.id


    respond_to do |format|
      if @person.save
        format.html { redirect_to people_path, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to  people_path, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:relationship, :first_name, :middle_name, :last_name, :birthday, :anniversary, :other, :other_date_name, :notes, :group, :user_id)
    end
end
