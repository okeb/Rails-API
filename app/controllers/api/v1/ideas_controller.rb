module Api
  module V1
    class IdeasController < BaseController
      before_action :prepare_idea, only: %i[show update destroy]

      def index
        pagy, ideas = paginate(Idea.order(created_at: :desc))
        render_resource_collection(ideas, pagy: pagy)
      end

      def show
        render_resource(@idea)
      end

      def create
        idea = Idea.new(idea_params)
        idea.save ? render_resource(idea, status: :created) : render_resource_errors(idea.errors)
      end

      def update
        @idea.update(idea_params) ? render_resource(@idea) : render_resource_errors(@idea.errors)
      end

      def destroy
        @idea.destroy!
        head :no_content
      end

      private

      def prepare_idea
        @idea = Idea.find(params[:id])
      end

      def idea_params
        params.require(:idea).permit(:title, :description)
      end
    end
  end
end


# module Api
#   module V1
#     class IdeasController < BaseController
#       before_action :prepare_idea, only: %i[show update destroy]

#       def index
#         ideas = Idea.order(created_at: :desc)
#         pagy, ideas = pagy(ideas, page: page_number, items: page_size)
#         render json: IdeaSerializer.new(ideas, { meta: pagy_metadata(pagy) })
#       end

#       def show
#         render json: IdeaSerializer.new(@idea)
#       end

#       def create
#         idea = Idea.new(idea_params)

#         if idea.save
#           render json: IdeaSerializer.new(idea), status: :created
#         else
#           render jsonapi_errors: idea.errors, status: :unprocessable_entity
#         end
#       end

#       def update
#         if @idea.update(idea_params)
#           render json: IdeaSerializer.new(@idea)
#         else
#           render jsonapi_errors: @idea.errors, status: :unprocessable_entity
#         end
#       end

#       def destroy
#         @idea.destroy!
#         head :no_content
#       end

#       private

#       def prepare_idea
#         @idea = Idea.find(params[:id])
#       end

#       def idea_params
#         params.require(:idea).permit(:title, :description)
#       end
#     end
#   end
# end