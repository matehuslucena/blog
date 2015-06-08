class ComentariosController < ApplicationController

	def create
		@post = recupera_post
    	@comentario = @post.comentarios.build(comentario_params)
	    if @comentario.save
	    	flash[:notice] = "Comentário foi criado com sucesso!"
	    end

	    redirect_to @post
	end

	def destroy
		@post = recupera_post
		@comentario = recupera_comentario
		@comentario.destroy

		redirect_to @comentario.post, notice: "Comentário apagado com sucesso."
	end

	def edit
		@post = recupera_post
		@comentario = recupera_comentario
	end

	def update
		@post = recupera_post
		@comentario = recupera_comentario.update(comentario_params)
		
		redirect_to @post
	end

	private 

    def comentario_params
        params.require(:comentario).permit(:nome_usuario, :texto)
    end 

    def recupera_post
    	@post = Post.find(params[:post_id])
    end

    def recupera_comentario
    	recupera_post.comentarios.find(params[:comentario_id])
    end
end