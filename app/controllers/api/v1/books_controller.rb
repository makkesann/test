module Api
    module V1
      class BooksController < ApplicationController
        protect_from_forgery with: :null_session
  
        def index
          books = Book.order(created_at: :desc)
          render json: { status: 'SUCCESS', message: 'Loaded posts', data: posts }
        end
      end
    end
  end