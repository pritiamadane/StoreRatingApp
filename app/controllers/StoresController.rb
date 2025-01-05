class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  def index
    @stores = Store.all
    @stores = @stores.where("name ILIKE ?", "%#{params[:search]}%") if params[:search].present?
  end

  def show
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to stores_path, notice: 'Store created successfully'
    else
      render :new
    end
  end

  private

  def set_store