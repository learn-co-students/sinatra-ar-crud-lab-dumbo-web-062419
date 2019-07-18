
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  #index
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #new
  get '/articles/new' do
    erb :new
  end

  #create
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  #show
  get '/articles/:id' do
    find_article
    erb :show
  end

  #edit
  get '/articles/:id/edit' do
    find_article
    erb :edit
  end

  #update
  patch '/articles/:id' do
    find_article
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end


  #delete
  delete "/articles/:id" do
    find_article
    @article.destroy
    redirect to "/articles"
  end



  def find_article
    @article = Article.find(params[:id])
  end

end
