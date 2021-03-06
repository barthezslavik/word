# frozen_string_literal: true

require 'open-uri'

class PhrasesController < ApplicationController
  before_action :set_phrase, only: %i[show edit update destroy]

  def similar
    entity = Phrase.find(params['entity']['id'])
    entity.update(similar: true)
    render json: Phrase.total
  end

  def unlearn
    entity = Phrase.find(params['entity']['id'])
    entity.update(similar: false)
    render json: Phrase.total
  end

  def done
    data = []
    phrases = Phrase.where('`german` LIKE ?', 'Das %')
    phrases.each do |p|
      name = begin
               p.german.split('das ')[1].split(',')[0]
             rescue StandardError
               next
             end
      entity = Entity.find_by(article: 'Das', german: name)
      if entity
        data << entity
        p.update!(similar: true)
      end
    end
    render json: data
  end

  def parse
    base = "https://app.memrise.com/course/920/5000-german-words-top-87/#{params[:page]}"
    content = open(base).read
    doc = Nokogiri::HTML(content)
    doc.css('.thing').each do |thing|
      german = thing.css('.col_a').text
      english = thing.css('.col_b').text
      Phrase.where(german: german, english: english).first_or_create!
    end

    head :ok
  end

  def repeat_en
    @phrases = Phrase.where(similar: true, category: 'noun').shuffle
    @dictionary = Entity.pluck(:german, :article).map { |g, a| "#{a} #{g}" }
  end

  def repeat_de
    @phrases = Phrase.where(similar: true, category: 'noun').shuffle
    @dictionary = Entity.pluck(:english)
  end

  # GET /phrases or /phrases.json
  def index
    @phrases = Phrase.all
  end

  # GET /phrases/1 or /phrases/1.json
  def show; end

  # GET /phrases/new
  def new
    @phrase = Phrase.new
  end

  # GET /phrases/1/edit
  def edit; end

  # POST /phrases or /phrases.json
  def create
    @phrase = Phrase.new(phrase_params)

    respond_to do |format|
      if @phrase.save
        format.html { redirect_to phrase_url(@phrase), notice: 'Phrase was successfully created.' }
        format.json { render :show, status: :created, location: @phrase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phrases/1 or /phrases/1.json
  def update
    respond_to do |format|
      if @phrase.update(phrase_params)
        format.html { redirect_to phrase_url(@phrase), notice: 'Phrase was successfully updated.' }
        format.json { render :show, status: :ok, location: @phrase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phrases/1 or /phrases/1.json
  def destroy
    @phrase.destroy

    respond_to do |format|
      format.html { redirect_to phrases_url, notice: 'Phrase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_phrase
    @phrase = Phrase.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def phrase_params
    params.require(:phrase).permit(:german, :english, :category)
  end
end
