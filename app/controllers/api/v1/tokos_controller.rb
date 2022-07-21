module Api
    module V1
        class TokosController < ApplicationController
            before_action :set_toko, only: [:show, :update, :destroy]

            def index
              @tokos = Toko.order(id: :DESC)
              render json: { status: 'SUCCESS', message: 'Loaded tokos', data: @tokos }, methods: [:image_url]
            end
      
            def show
              render json: { status: 'SUCCESS', message: 'Loaded the toko', data: @toko }, methods: [:image_url]
            end
      
            def create
              @toko = Toko.new(toko_params)
              @toko.Heart = 0
              if @toko.save
                render json: { status: 'SUCCESS', data: @toko }, methods: [:image_url]
              else
                render json: { status: 'ERROR', data: @toko.errors }
              end
            end
      
            def destroy
              @toko.destroy
              render json: { status: 'SUCCESS', message: 'Deleted the toko', data: @toko }
            end
      
            def update
              if @toko.update(toko_params)
                render json: { status: 'SUCCESS', message: 'Updated the toko', data: @toko }
              else
                render json: { status: 'ERROR', message: 'Not updated', data: @toko.errors }
              end
            end

            def heart
              @toko = Toko.order(Heart: :DESC)
              render json: { status: 'SUCCESS', message: 'Loaded the toko', data: @toko}, methods: [:image_url]
            end

            def random
              @toko = Toko.find_by_id(rand(Toko.count) + 1)
              render json: { status: 'SUCCESS', message: 'Loaded the toko', data: @toko}, methods: [:image_url]
            end

            def favorite
              @toko = Toko.find(params[:toko_id])
              @toko.Heart = @toko.Heart + 1
              if @toko.save
                render json: { status: 'SUCCESS', message: 'Updated the toko', data: @toko}, methods: [:image_url]
              else
                render json: { status: 'ERROR', message: 'Not updated', data: @toko.errors}
              end
            end

            private
      
            def set_toko
              @toko = Toko.find(params[:id])
            end
      
            def toko_params
              params.require(:toko).permit(:name, :comment, :Heart, :image)
            end
        end
    end
end
