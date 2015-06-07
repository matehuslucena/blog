class ComentariosController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
    	@comentario = @post.comentarios.build(comentario_params)
	    if @comentario.save
	    	flash[:notice] = "Comentário foi criado com sucesso!"
	    end

	    redirect_to @post
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comentario = @post.comentarios.find(params[:comentario_id])
		@comentario.destroy

		redirect_to @comentario.post, notice: "Comentário apagado com sucesso."
	end

	private 

    def comentario_params
        params.require(:comentario).permit(:nome_usuario, :texto)
    end 
end