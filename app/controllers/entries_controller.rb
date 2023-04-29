# frozen_string_literal: true

# Controller
class EntriesController < ApplicationController
  before_action :set_entry, only: %i[show edit update destroy]

  # GET /entries or /entries.json
  def index
    date = Date.today.in_time_zone('America/Sao_Paulo')
    @entries = Entry.where(created_at: date.all_day)
  end

  # GET /entries/1 or /entries/1.json
  def show = nil

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit = nil

  # POST /entries or /entries.json
  def create
    @entry = Entry.new(entry_params)
    respond_to_save(
      @entry.save,
      "#{@entry.meal_type} was successfully created."
    )
  end

  # PATCH/PUT /entries/1 or /entries/1.json
  def update
    respond_to_save(
      @entry.update(entry_params),
      "#{@entry.meal_type} was successfully updated."
    )
  end

  # DELETE /entries/1 or /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html do
        redirect_to entries_url,
                    notice: "#{@entry.meal_type} was successfully destroyed."
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entry
    @entry = Entry.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entry_params
    params.require(:entry).permit(
      :meal_type,
      :calories,
      :proteins,
      :carbohydrates,
      :fats
    )
  end

  def respond_to_save(func, notice)
    respond_to do |format|
      if func
        format.html { redirect_to entry_url(@entry), notice: notice.to_s }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
end
