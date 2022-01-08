# frozen_string_literal: true

class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show edit update destroy]

  def learn
    entity = Entity.find(params['entity']['id'])
    entity.update(entity_params.except('id'))
    head :ok
  end

  def similar
    entity = Entity.find(params['entity']['id'])
    entity.update(similar: true)
    render json: 2000 - Entity.where(done_german: true, similar: true).count
  end

  def articles
    @entities = Entity.where(done_article: true, article: Entity::ARTICLES, similar: true).shuffle
  end

  def phrases_en
    @entities = Phrase.progress
    @dictionary = Phrase.progress

    if params[:category]
      @entities = @entities.where(category: params[:category])
      @dictionary = @dictionary.where(category: params[:category])
    end

    @dictionary = @dictionary.pluck(:german)
    @entities = @entities.shuffle
  end

  def phrases_de
    @entities = Phrase.progress
    @dictionary = Phrase.progress

    if params[:category]
      @entities = @entities.where(category: params[:category])
      @dictionary = @dictionary.where(category: params[:category])
    end

    @dictionary = @dictionary.pluck(:english)
    @entities = @entities.shuffle
  end

  def words
    @entities = Entity.where(done_german: true, similar: true).shuffle
    @dictionary = Entity.pluck(:german, :article).map { |g, a| "#{a} #{g}" }
  end

  def words_de
    @entities = Entity.where(done_german: true, similar: true).shuffle
    @dictionary = Entity.pluck(:english)
  end

  # GET /entities or /entities.json
  def index
    @entities = Phrase.where(similar: true).order('updated_at').reverse
  end

  # GET /entities/1 or /entities/1.json
  def show; end

  # GET /entities/new
  def new
    @entity = Entity.new
  end

  # GET /entities/1/edit
  def edit; end

  # POST /entities or /entities.json
  def create
    @entity = Entity.new(entity_params)

    respond_to do |format|
      if @entity.save
        format.html { redirect_to entity_url(@entity), notice: 'Entity was successfully created.' }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entities/1 or /entities/1.json
  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to entity_url(@entity), notice: 'Entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entities/1 or /entities/1.json
  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to entities_url, notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entity
    @entity = Entity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:english, :article, :german, :done_article, :done_german)
  end
end
