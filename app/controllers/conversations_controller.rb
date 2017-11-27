class ConversationsController < ApplicationController

  # GET /conversations
  # GET /conversations.json
  def index
    @conversations = Conversation.all
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
  end

  # GET /conversations/new
  def new 
    binding.pry
    @conversation = Conversation.new.save
  end

  # GET /conversations/1/edit
  def edit
  end

  def get_all_conversations_by_user
    
    reponse_status = 200
    ActiveRecord::Base.transaction do
      @conversations = Conversation.where(:sender_id => 1).all
    end

    if @conversations != nil
      response_message = (@conversations.count < 1) ? true : false ? "No Conversations Found for the User." : "Success!" 
    else  
      reponse_status = 500
      response_message = "Failure!"
    end  

    respond_to do |format|
        msg = { :status => reponse_status, :message => response_message, :conversation => @conversations }
        format.json  { render :json => msg } 
    end

  end

  def get_conversations_by_sender_and_reciever
    
    reponse_status = 200 
    messages = Array.new
    
    ActiveRecord::Base.transaction do
      @conversation = Conversation.where(:sender_id => 1 , :recipient_id => 2 )

      if !@conversation.nil? && !@conversation.blank? 
        @conversation.each do |conversation|
             messages.push(conversation.messages)
        end
      end
    end

    respond_to do |format|
        msg = { :status => reponse_status, :message => "Success!", :conversation => @conversation  , :messages => messages}
        format.json  { render :json => msg } # don't do msg.to_json
    end

  end 

  # POST /conversations
  # POST /conversations.json
  def create
    @conversation = Conversation.new
    respond_to do |format|
      if @conversation.save
        
        format.html { redirect_to @conversation, notice: 'Conversation was successfully created.' }
        format.json { render :show, status: :created, location: @conversation }
      else
        format.html { render :new }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conversations/1
  # PATCH/PUT /conversations/1.json
  def update
    respond_to do |format|
      if @conversation.update(conversation_params)
        format.html { redirect_to @conversation, notice: 'Conversation was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversation }
      else
        format.html { render :edit }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.json
  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to conversations_url, notice: 'Conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # private
    # Use callbacks to share common setup or constraints between actions.
    # def set_conversation
    #   @conversation = Conversation.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def conversation_params
    #   params.fetch(:conversation, {})
    # end
end
